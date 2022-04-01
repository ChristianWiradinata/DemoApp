//
//  KiniCintakuCollectionViewCell.swift
//  demoPorject
//
//  Created by Christian Wiradinata on 01/04/22.
//

import UIKit

protocol KiniCintakuCollectionViewCellDelegate:NSObjectProtocol{
    func buttonClicked()
}

@available(iOS 13.0, *)
class KiniCintakuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Subtitle: UILabel!
    @IBOutlet weak var Screen_Width: NSLayoutConstraint!
    
    weak var delegate:KiniCintakuCollectionViewCellDelegate?
    
    var x = 0
    var y = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func onClick(_ sender: Any) {
        if kiniCintaku[x].extendedModel![y].status == false {
            Button.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        resetButton()
    }
    
    private func resetButton() {
        for data in kiniCintaku {
            for ext in data.extendedModel! {
                ext.status = false
            }
        }
        kiniCintaku[x].extendedModel![y].status = true
        if let delegate = self.delegate{
            delegate.buttonClicked()
        }
    }
}
