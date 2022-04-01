//
//  MetodeCell.swift
//  demoPorject
//
//  Created by Christian Wiradinata on 31/03/22.
//

import UIKit

class MetodeCell: UITableViewCell {
    
    @IBOutlet weak var Screen: UIView!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var Title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        Screen.CornerShadow(corners: [.allCorners], color: UIColor.white.cgColor, height: 0, curve: 10, shaddow: 0.3)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
