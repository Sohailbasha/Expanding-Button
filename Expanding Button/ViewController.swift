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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.centerButton.center = self.view.center
        self.centerButton.addTarget(self, action: #selector(self.buttonTapped(_:)), for: .touchUpInside)
        self.view.addSubview(centerButton)
    }

    @objc fileprivate func buttonTapped(_ sender: UIButton) {
        print("button tapped!")
//        makeButtonsAppear()
    }
    
    func makeButtonsAppear(sender: UIButton) {
        for i in 0...4 {
            let button = UIButton()
            button.frame = CGRect(x: 50, y: 50, width: 56, height: 56)
            button.backgroundColor = UIColor.purple
            print("button: \(i)")
            
            switch i {
            case 0:
                button.setImage(#imageLiteral(resourceName: "snapchat"), for: .normal)
                button.alpha = 1
                self.view.addSubview(button)

            case 1:
                button.setImage(#imageLiteral(resourceName: "google-plus"), for: .normal)
                button.alpha = 1
                self.view.addSubview(button)
            case 2:
                button.setImage(#imageLiteral(resourceName: "twitter"), for: .normal)
                button.alpha = 1
                self.view.addSubview(button)
            case 3:
                button.setImage(#imageLiteral(resourceName: "telegram"), for: .normal)
                button.alpha = 1
                self.view.addSubview(button)
            case 4:
                button.setImage(#imageLiteral(resourceName: "soundcloud"), for: .normal)
                self.view.addSubview(button)
            default:
                return
            }
        }
    }
    

    
    
}

