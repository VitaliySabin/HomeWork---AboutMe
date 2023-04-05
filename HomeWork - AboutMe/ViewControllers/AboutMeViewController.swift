//
//  AboutMeViewController.swift
//  HomeWork - AboutMe
//
//  Created by Виталий Сабин on 05.04.2023.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet var homeTownLabel: UILabel!
    @IBOutlet var birthDateLabel: UILabel!
    
    @IBOutlet var occupationLabel: UILabel!
    @IBOutlet var specialityLabel: UILabel!
    @IBOutlet var universityLabel: UILabel!
    
    
    @IBOutlet var photo: UIImageView!
    
    
    var person: Person!
    
    override func viewWillLayoutSubviews() {
        photo.layer.cornerRadius = photo.frame.height / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = person.name + " " + person.surname
        photo.image = UIImage(named: person.photo)
        updateLabels()
    }
    
    private func updateLabels() {
        homeTownLabel.text = "Home town: " + person.homeTown
        birthDateLabel.text = "Date of birth: " + person.dateOfBirth
        
        occupationLabel.text = "Occupation: " + person.occupation
        specialityLabel.text = "Speciality: " + person.speciality
        universityLabel.text = "University: " + person.university
    }
}
