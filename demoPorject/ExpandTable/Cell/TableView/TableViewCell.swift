//
//  TheTableViewCell.swift
//  demoPorject
//
//  Created by Christian Wiradinata on 01/04/22.
//

import UIKit

protocol TableViewCellDelegate:NSObjectProtocol{
    func buttonClicked()
}

@available(iOS 13.0, *)
class TableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var Header: UILabel!
    @IBOutlet weak var Footer: UILabel!
    @IBOutlet weak var Expand_Height: NSLayoutConstraint!
    @IBOutlet weak var cv: UICollectionView!
    weak var delegate: TableViewCellDelegate?
    var CellIndex: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataModel[CellIndex!.row].extendedModel!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        //MARK: - Calculation
        
        //MARK: - Pass Variable.
        cell.x = CellIndex?.row ?? 0
        cell.y = indexPath.row
        cell.delegate = self
        
        //MARK: - CUSTOM THE CELL
        if dataModel[CellIndex!.row].extendedModel!.count == 1 {
            cell.Screen_Width.constant = self.contentView.frame.width
        } else {
            cell.Screen_Width.constant = self.contentView.frame.width / 2 - 20
        }
        cell.Title.text = dataModel[CellIndex!.row].extendedModel?[indexPath.row].title
        cell.Subtitle.text = dataModel[CellIndex!.row].extendedModel?[indexPath.row].subTitle
        
        if dataModel[CellIndex?.row ?? 0].extendedModel![indexPath.row].status {
            cell.Button.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            cell.Button.setImage(UIImage(systemName: "square"), for: .normal)
        }
        
        return cell
    }
    
    private func setup() {
        cv.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        cv.dataSource = self
        cv.delegate = self
    }
}

@available(iOS 13.0, *)
extension TableViewCell: CollectionViewCellDelegate{
    func buttonClicked() {
        if let delegate = self.delegate{
            delegate.buttonClicked()
        }
        cv.reloadData()
    }
}
