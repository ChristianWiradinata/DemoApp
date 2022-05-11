//
//  MetodeCollectionViewCell.swift
//  demoPorject
//
//  Created by Christian Wiradinata on 05/04/22.
//

import UIKit


protocol MetodeCVCellDelegate:NSObjectProtocol{
    func ActiveChange(y: Int)
}

class MetodeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var screen: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var button: UIButton!
    
    weak var delegate:MetodeCVCellDelegate?
    var Metode = [PaymentModel]()
    var x = 0
    var y = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        screen.layer.borderColor = UIColor(named: "blue")?.cgColor
        screen.layer.borderWidth = 1
        screen.layer.cornerRadius = 20
    }

    @IBAction func button_onClick(_ sender: Any) {
        for jenis in Metode[x].PaymentMethod {
            jenis.isActive = false
        }
        Metode[x].PaymentMethod[y].isActive = true
        if let delegate = self.delegate{
            delegate.ActiveChange(y: y)
        }
    }
}
