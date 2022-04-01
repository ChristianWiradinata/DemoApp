//
//  ProfilePageViewController.swift
//  demoPorject
//
//  Created by Christian Wiradinata on 28/03/22.
//

import UIKit
import Kingfisher

class ProfilePageViewController: UIViewController {
    
    var testView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setting()
        setup()
        startAnimation()
    }
    
    private func setting() {
        //MARK: - Test UIView
        testView = UIView(frame: CGRect(
        x: 0,
        y: 0,
        width: self.view.frame.width,
        height: 200
        ))
        testView.backgroundColor = UIColor.blue
    }
    
    private func setup() {
        self.view.addSubview(testView)
    }
    
    private func startAnimation() {
        
    }
}
