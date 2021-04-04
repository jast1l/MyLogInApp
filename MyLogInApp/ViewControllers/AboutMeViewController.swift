//
//  AboutMeViewController.swift
//  MyLogInApp
//
//  Created by MACBOOK on 03.04.2021.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet weak var stroryLabel: UILabel!
    @IBOutlet weak var prewieStory: UILabel!
    
    var persone: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canfigureAppearance()
    }
}


extension AboutMeViewController {
    private func canfigureAppearance() {
        view.addVerticalGradientLayer()
        
        stroryLabel.text = persone.story.rawValue
        prewieStory.text = persone.story.moreDetailed
    }
}
