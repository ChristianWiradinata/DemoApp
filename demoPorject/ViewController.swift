//
//  ViewController.swift
//  demoPorject
//
//  Created by Christian Wiradinata on 28/03/22.
//

import UIKit

@available(iOS 13.0, *)
class ViewController: UIViewController {
    
    //MARK: - Creating
    var title_label = UILabel()
    var bottom_view = UIView()
    var bottom_label = UILabel()
    var bottomArrow = UILabel()
    var swipeUpGesture = UISwipeGestureRecognizer();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("This is View Controller")

        setting()
        setup()
        startAnimation()
        stopAnimation()
        
        gotoExpandTable(self: self)
    }
    
    private func setting() {
        //MARK: - Centered Label
        title_label = UILabel(frame: CGRect(
            x: 0,
            y: 0,
            width: self.view.frame.width,
            height: self.view.frame.height
        ))
        title_label.center = self.view.center
        title_label.textAlignment = .center
        title_label.font = title_label.font.withSize(self.view.frame.height/16)
        title_label.numberOfLines = 10
        title_label.text = "ERROR\nYOU DIDN'T LOAD\nVIEW CONTROLLER"
        
        //MARK: - Bottom UIView
        bottom_view = UIView(frame: CGRect(
        x: 0,
        y: self.view.frame.maxY - 90,
        width: self.view.frame.width,
        height: self.view.frame.height/10 + self.view.frame.height/20
        ))
        
        //MARK: - Bottom Label
        bottom_label = UILabel(frame: CGRect(
            x: 0,
            y: self.view.frame.maxY - (self.view.frame.maxY / 9.9555555556),
            width: self.view.frame.width,
            height: self.view.frame.height/20
        ))
        bottom_label.textAlignment = .center
        bottom_label.font = title_label.font.withSize(self.view.frame.height/40)
        bottom_label.numberOfLines = 1
        bottom_label.text = "SWIPE UP"
        
        //MARK: - Bottom animated navigator
        bottomArrow = UILabel(frame: CGRect(
            x: 0,
            y: self.view.frame.maxY - (self.view.frame.maxY / 14.9333333333),
            width: self.view.frame.width,
            height: self.view.frame.height/10
        ))
        bottomArrow.textAlignment = .center
        bottomArrow.font = title_label.font.withSize(self.view.frame.height/10)
        bottomArrow.numberOfLines = 10
        bottomArrow.text = "^"
        
        //MARK: - Swipe Gesture
        swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(screenSwiped(gestureRecognizer:)));
        swipeUpGesture.direction = .up
    }
    
    private func setup() {
        self.view.addSubview(title_label)
        self.view.addSubview(bottom_view)
        self.bottom_view.addGestureRecognizer(swipeUpGesture)
        self.view.addSubview(bottom_label)
        self.view.addSubview(bottomArrow)
    }
    
    private func startAnimation() {
        animation = true
        labelSmaller(theLabel: bottomArrow)
        labelWithoutAlpha(theLabel: bottom_label)
    }
    
    private func stopAnimation() {
        animation = false
    }
    
    @IBAction func screenSwiped(gestureRecognizer:UISwipeGestureRecognizer) {
        if self.view.backgroundColor == UIColor.blue {
            self.view.backgroundColor = UIColor.white
        } else {
            self.view.backgroundColor = UIColor.blue
        }
        stopAnimation()
    }
    
}
