//
//  PanduanTableViewCell.swift
//  demoPorject
//
//  Created by Christian Wiradinata on 05/04/22.
//

import UIKit

class PanduanTableViewCell: UITableViewCell {

    @IBOutlet weak var count_screen: UIView!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var count_title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        count_screen.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
