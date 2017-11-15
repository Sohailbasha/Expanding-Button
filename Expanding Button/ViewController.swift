//
//  ViewController.swift
//  Expanding Button
//
//  Created by Ilias Basha on 11/14/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let centerButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 56, height: 56)
        button.backgroundColor = UIColor.lightGray
        button.setImage(#imageLiteral(resourceName: "add"), for: .normal)
        button.layer.cornerRadius = 0.5 * button.layer.bounds.height
        //        button.clipsToBounds = true
        return button
    }()
    
    var didTap: Bool = false
    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.centerButton.center = self.view.center
        self.centerButton.addTarget(self, action: #selector(self.buttonTapped(_:)), for: .touchUpInside)
        self.view.addSubview(centerButton)
        addButtons()
    }
    
    @objc fileprivate func buttonTapped(_ sender: UIButton) {
        didTap == true ? makeButtonsDissapear() : makeButtonsAppear(sender: sender)
    }
    
    func addButtons() {
        for i in 0...3 {
            let button = UIButton()
            button.frame = CGRect(x: 0, y: 0, width: 56, height: 56)
            button.center = self.view.center
            button.alpha = 0
            switch i {
            case 0:
                button.setImage(#imageLiteral(resourceName: "snapchat"), for: .normal)
            case 1:
                button.setImage(#imageLiteral(resourceName: "linkedin"), for: .normal)
            case 2:
                button.setImage(#imageLiteral(resourceName: "twitter"), for: .normal)
            case 3:
                button.setImage(#imageLiteral(resourceName: "soundcloud"), for: .normal)
            default:
                return
            }
            self.buttons.append(button)
        }
    }
    
    
    func makeButtonsAppear(sender: UIButton) {
        for i in 0...3 {
            let button = buttons[i]
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: [], animations: {
                self.centerButton.transform = CGAffineTransform(rotationAngle: CGFloat(45.0 * Double.pi / 180))
                self.view.addSubview(button)
                button.alpha = 1
                switch i {
                case 0:
                    button.center.y = sender.center.y - 100
                case 1:
                    button.center.x = sender.center.x + 100
                case 2:
                    button.center.x = sender.center.x - 100
                case 3:
                    button.center.y = sender.center.y + 100
                default:
                    return
                }
            }, completion: { (_) in
                self.didTap = true
            })
        }
    }
    
    func makeButtonsDissapear() {
        for i in 0...3 {
            let button = buttons[i]
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: [], animations: {
                self.centerButton.transform = CGAffineTransform.identity
                button.center = self.view.center
                button.alpha = 0
            }, completion: { (_) in
                self.didTap = false
                button.removeFromSuperview()
            })
        }
    }
    
    
    
    
}

