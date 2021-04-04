//
//  MyWorkViewController.swift
//  MyLogInApp
//
//  Created by MACBOOK on 03.04.2021.
//

import UIKit

class MyWorkViewController: UIViewController {
    
    @IBOutlet weak var tittleWorkLabel: UILabel!
    @IBOutlet weak var workImage: UIImageView!
    @IBOutlet weak var workInfoLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    var person: User!
    var counterPages = 0
    
    let progress: Float = 1 / 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canfigureAppearance()
    }
    
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
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


extension MyWorkViewController {
    private func changeData() {
        switch counterPages {
        case 1 :
            tittleWorkLabel.text = person.myWork[1].description.rawValue
            workImage.image = UIImage(named: person.myWork[1].picture)
            workInfoLabel.text = person.myWork[1].description.moreDetailed
            nextButton.title = "Next"
            backButton.isEnabled = true
            nextButton.isEnabled = true
        case 2:
            tittleWorkLabel.text = person.myWork[2].description.rawValue
            workImage.image = UIImage(named: person.myWork[2].picture)
            workInfoLabel.text = person.myWork[2].description.moreDetailed
            nextButton.title = "It's Over"
            nextButton.isEnabled = false
        default:
            view.addVerticalGradientLayer()
            tittleWorkLabel.text = person.myWork[0].description.rawValue
            workImage.image = UIImage(named: person.myWork[0].picture)
            workInfoLabel.text = person.myWork[0].description.moreDetailed
            nextButton.title = "Next"
            backButton.isEnabled = false
        }
    }
}

extension MyWorkViewController {
    private func canfigureAppearance() {
    nextButton.isEnabled = true
    backButton.isEnabled = false
    
    progressView.progress = progress
    
    view.addVerticalGradientLayer()
    
    tittleWorkLabel.text = person.myWork[0].description.rawValue
    workImage.image = UIImage(named: person.myWork[0].picture)
    workInfoLabel.text = person.myWork[0].description.moreDetailed
    }
}
