//
//  WelcomeViewController.swift
//  MyLogInApp
//
//  Created by MACBOOK on 03.04.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var tittleImage: UIImageView!
    
    var persone: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canfigureAppearance()
    }
}

extension WelcomeViewController {
    private func canfigureAppearance() {
        tittleImage.image = UIImage(named: persone.profilePhoto)
        tittleImage.layer.cornerRadius = 20
        
        logOutButton.layer.cornerRadius = 10
        welcomeLabel.text = "Welcome, \(persone.name)!"
        
        view.addVerticalGradientLayer()
    }
}

