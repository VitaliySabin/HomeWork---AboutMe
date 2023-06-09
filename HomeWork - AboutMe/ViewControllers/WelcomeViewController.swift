//
//  WelcomeViewController.swift
//  HomeWork - AboutMe
//
//  Created by Виталий Сабин on 05.04.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    var user: User!
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer(topColor: .cyan, bottomColor: .blue)
        
        welcomeLabel.text = "Welcome, " + user.username + "!"
        nameLabel.text = "My name is " + person.name + " " + person.surname + "."
    }
}
