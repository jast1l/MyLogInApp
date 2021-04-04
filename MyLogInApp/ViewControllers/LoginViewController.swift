//
//  ViewController.swift
//  MyLogInApp
//
//  Created by MACBOOK on 03.04.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Private properties
    private let persone = User.getUser()
    
    // MARK: - DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        canfigureAppearance()
    }
    
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        
        if let viewControllers = tabBarController.viewControllers {
            for viewController in viewControllers {

                if let welcomeVC = viewController as? WelcomeViewController {
                    welcomeVC.persone = self.persone
                } else if let aboutVC = viewController as? AboutMeViewController {
                    aboutVC.persone = self.persone
                } else if let workNavigationVC = viewController as? UINavigationController,
                          let workVC = workNavigationVC.topViewController as? MyWorkViewController {
                        workVC.person = self.persone
                } else if let freeNavigationVC = viewController as? UINavigationController,
                          let freeTimeVC = freeNavigationVC.topViewController as? FreeTimeViewController {
                        freeTimeVC.persone = self.persone
                    }
            }
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTF.text = nil
        passwordTF.text = nil
        loginButton.isEnabled = false
    }
    
    //MARK: -Button
    @IBAction func logInPressed() {
        if loginTF.text != persone.login || passwordTF.text != persone.password {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTF
            )
            return
        }
        performSegue(withIdentifier: "welcomeVC", sender: self)
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Oops!", message: "Your name is \(persone.login) 😉")
            : showAlert(title: "Oops!", message: "Your password is \(persone.password) 😉")
    }
}



//MARK: -Keyboard manager
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInPressed()
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let passwordTF = passwordTF.text,
           passwordTF != "",
           let loginTF = loginTF.text,
           loginTF != "" {
            
            loginButton.alpha = 1
            loginButton.isEnabled = true
        } else {
            loginButton.alpha = 0.6
            loginButton.isEnabled = false
        }
    }
}

extension LoginViewController {
    private func canfigureAppearance() {
        loginTF.delegate = self
        passwordTF.delegate = self
        
        view.addVerticalGradientLayer()
        
        loginButton.layer.cornerRadius = 10
        loginButton.layer.backgroundColor = #colorLiteral(red: 0.1802025139, green: 0.4792167544, blue: 0.9991418719, alpha: 1)
        loginButton.alpha = 0.6
        loginButton.isEnabled = false
    }
}

//MARK: -AlerController
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


