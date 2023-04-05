//
//  BioViewController.swift
//  HomeWork - AboutMe
//
//  Created by Виталий Сабин on 05.04.2023.
//

import UIKit

class BioViewController: UIViewController {

    @IBOutlet var biographyLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        biographyLabel.text = person.biography
    }
}
