//
//  TheCollectionViewCell.swift
//  demoPorject
//
//  Created by Christian Wiradinata on 01/04/22.
//

import UIKit

protocol CollectionViewCellDelegate:NSObjectProtocol{
    func buttonClicked()
}

@available(iOS 13.0, *)
class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Subtitle: UILabel!
    @IBOutlet weak var Screen_Width: NSLayoutConstraint!
    
    weak var delegate:CollectionViewCellDelegate?
    
    var x = 0
    var y = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func onClick(_ sender: Any) {
        if dataModel[x].extendedModel![y].status == false {
            Button.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        resetButton()
    }
    
    private func resetButton() {
        for data in dataModel {
            for ext in data.extendedModel! {
                ext.status = false
            }
        }
        dataModel[x].extendedModel![y].status = true
        if let delegate = self.delegate{
            delegate.buttonClicked()
        }
    }
}
