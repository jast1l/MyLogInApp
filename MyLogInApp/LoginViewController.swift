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
    private let user = "User"
    private let password = "Password"
    
    // MARK: - DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTF.delegate = self
        passwordTF.delegate = self
        
        loginButton.layer.cornerRadius = 10
        loginButton.layer.backgroundColor = #colorLiteral(red: 0.1802025139, green: 0.4792167544, blue: 0.9991418719, alpha: 1)
        loginButton.alpha = 0.6
        loginButton.isEnabled = false
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.name = loginTF.text
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTF.text = nil
        passwordTF.text = nil
        loginButton.isEnabled = false
    }
    
    //MARK: -Button
    @IBAction func logInPressed() {
        if loginTF.text != user || passwordTF.text != password {
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
            ? showAlert(title: "Oops!", message: "Your name is \(user) 😉")
            : showAlert(title: "Oops!", message: "Your password is \(password) 😉")
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


