//
//  Function.swift
//  demoPorject
//
//  Created by Christian Wiradinata on 28/03/22.
//

import Foundation
import UIKit

//MARK: - Global variable
var animation = false
var dataModel = [DataModel]()

//MARK: - GO TO VIEW CONTROLLER
func back(vc: UIViewController) {
    vc.view.removeFromSuperview()
}

func gotoProfilePage(self: UIViewController) {
    let goto = ProfilePageViewController(nibName: "ProfilePageViewController", bundle: nil)
    self.view.addSubview(goto.view)
    self.addChild(goto)
}

func gotoCaraBayarPage(self: UIViewController) {
    let goto = CaraBayarViewController(nibName: "CaraBayarViewController", bundle: nil)
    self.view.addSubview(goto.view)
    self.addChild(goto)
}

@available(iOS 13.0, *)
func gotoExpandTable(self: UIViewController) {
    let goto = TheViewController(nibName: "TheViewController", bundle: nil)
    self.view.addSubview(goto.view)
    self.addChild(goto)
}

//MARK: - Animation
func labelBigger(theLabel: UILabel) {
    UILabel.animate(withDuration: 0.7, animations: {
        if animation {
            theLabel.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
    }, completion: { _ in
        labelSmaller(theLabel: theLabel)
    })
}

func labelSmaller(theLabel: UILabel) {
    UILabel.animate(withDuration: 0.7, animations: {
        if animation{
            theLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }, completion: { _ in
        labelBigger(theLabel: theLabel)
    })
}

func labelWithAlpha(theLabel: UILabel) {
    UILabel.animate(withDuration: 0.7, animations: {
        if animation {
            theLabel.alpha = 1
        }
    }, completion: { _ in
        labelWithoutAlpha(theLabel: theLabel)
    })
}

func labelWithoutAlpha(theLabel: UILabel) {
    UILabel.animate(withDuration: 0.7, animations: {
        if animation {
            theLabel.alpha = 0
        }
    }, completion: { _ in
        labelWithAlpha(theLabel: theLabel)
    })
}

extension UIView {
    func CornerShadow(corners: UIRectCorner, color: CGColor, height: Int, curve: Int, shaddow: Float){
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: curve, height: curve)).cgPath
        let mask = CAShapeLayer()
        
        
        mask.masksToBounds = false
        mask.shadowRadius = 3
        mask.shadowOpacity = shaddow
        mask.fillColor = color
        mask.shadowColor = UIColor.black.cgColor
        mask.shadowOffset = CGSize(width: 0, height: height)
        mask.shadowPath = path
        
        mask.path = path
        layer.mask = mask
        layer.insertSublayer(mask, at: 0)
    }
}
