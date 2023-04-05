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
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let firstVC = viewController as? WelcomeViewController {
                // Передать данные
            } else if let secondVC = viewController as? AboutMeViewController {
                // Передать данные
            }
        }
    }
    
    @IBAction func logInButtonPressed() {
        guard usernameTextField.text == user.username, passwordTextField.text == user.password else {
            showAlert(
                with: "Invalid login or password!",
                and: "Please, try again"
            )
            return
        }
        performSegue(withIdentifier: "goToWelcomeVC", sender: nil)
    }
    
    @IBAction func remindUserData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(with: "Ooops!", and: "Your login is Alexey")
            : showAlert(with: "Ooops", and: "Your password is Efimov")
    }
}

// MARK: - AlertController

extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
    }
}
