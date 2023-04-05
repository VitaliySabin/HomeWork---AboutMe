//
//  WelcomeViewController.swift
//  HomeWork - AboutMe
//
//  Created by Виталий Сабин on 05.04.2023.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    var username: String!
    var name: String!
    var surname: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, " + username + "!"
        nameLabel.text = "My name is " + name + " " + surname + "."
    }
}
