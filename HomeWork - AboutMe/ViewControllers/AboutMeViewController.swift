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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: .cyan, bottomColor: .blue)
        
        navigationItem.title = person.name + " " + person.surname
        photo.image = UIImage(named: person.photo)
        updateLabels()
    }
    
    override func viewWillLayoutSubviews() {
        // Не понимаю, почему не получается круг из ImageView.
        // Сделал всё тоже самое, как в светофоре
        photo.layer.cornerRadius = photo.frame.width / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bioVC = segue.destination as? BioViewController else { return }
        bioVC.person = person
    }
    
    private func updateLabels() {
        homeTownLabel.text = "Home town: " + person.homeTown
        birthDateLabel.text = "Date of birth: " + person.dateOfBirth
        
        occupationLabel.text = "Occupation: " + person.occupation
        specialityLabel.text = "Speciality: " + person.speciality
        universityLabel.text = "University: " + person.university
    }
}
