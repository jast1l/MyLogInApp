//
//  FreeTimeViewController.swift
//  MyLogInApp
//
//  Created by MACBOOK on 03.04.2021.
//

import UIKit

class FreeTimeViewController: UIViewController {

    @IBOutlet weak var tittleFreeLabel: UILabel!
    @IBOutlet weak var freeImage: UIImageView!
    @IBOutlet weak var freeInfoLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    var persone: User!
    var counterPages = 0
    
    let progress: Float = 1 / 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canfigureAppearance()
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
            self.navigationItem.hidesBackButton = false
            counterPages += 1
            progressView.progress += progress
            changeData()
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        counterPages -= 1
        progressView.progress -= progress
        changeData()
    }
}


extension FreeTimeViewController {
    private func changeData() {
        switch counterPages {
        case 1 :
            tittleFreeLabel.text = persone.myFreeTime[1].description.rawValue
            freeImage.image = UIImage(named: persone.myFreeTime[1].picture)
            freeInfoLabel.text = persone.myFreeTime[1].description.moreDetailed
            nextButton.title = "Next"
            backButton.isEnabled = true
            nextButton.isEnabled = true
        case 2:
            tittleFreeLabel.text = persone.myFreeTime[2].description.rawValue
            freeImage.image = UIImage(named: persone.myFreeTime[2].picture)
            freeInfoLabel.text = persone.myFreeTime[2].description.moreDetailed
            nextButton.title = "It's Over"
            nextButton.isEnabled = false
        default:
            view.addVerticalGradientLayer()
            tittleFreeLabel.text = persone.myFreeTime[0].description.rawValue
            freeImage.image = UIImage(named: persone.myFreeTime[0].picture)
            freeInfoLabel.text = persone.myFreeTime[0].description.moreDetailed
            nextButton.title = "Next"
            backButton.isEnabled = false
        }
    }
}

extension FreeTimeViewController {
    private func canfigureAppearance() {
        nextButton.isEnabled = true
        backButton.isEnabled = false
        
        progressView.progress = progress
        
        view.addVerticalGradientLayer()
        
        tittleFreeLabel.text = persone.myFreeTime[0].description.rawValue
        freeImage.image = UIImage(named: persone.myFreeTime[0].picture)
        freeInfoLabel.text = persone.myFreeTime[0].description.moreDetailed
    }
}
