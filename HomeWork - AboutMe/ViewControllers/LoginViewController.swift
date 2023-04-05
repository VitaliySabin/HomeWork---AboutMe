//
//  ViewController.swift
//  HomeWork - AboutMe
//
//  Created by Виталий Сабин on 04.04.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = User.getUser()
    private let person = Person.getPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: .cyan, bottomColor: .blue)
        
        usernameTextField.text = user.username
        passwordTextField.text = user.password
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination
                as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
                welcomeVC.person = person
            } else if let navigationVC = viewController
                        as? UINavigationController {
                guard let aboutMeVC = navigationVC.topViewController
                        as? AboutMeViewController else { return }
                aboutMeVC.person = person
            }
        }
    }
    
    @IBAction func logInButtonPressed() {
        guard usernameTextField.text == user.username,
              passwordTextField.text == user.password else {
            showAlert(
                title: "Invalid login or password!",
                message: "Please, try again!",
                textField: passwordTextField
            )
            return
        }
        performSegue(withIdentifier: "goToWelcomeVC", sender: nil)
    }
    
    @IBAction func remindUserData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Ooops!", message: "Your login is \(user.username).")
        : showAlert(title: "Ooops!", message: "Your password is \(user.password).")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}

// MARK: - AlertController

extension LoginViewController {
    private func showAlert(
        title: String,
        message: String,
        textField: UITextField? = nil
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = "" }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Keyboard Settings

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
    }
}
