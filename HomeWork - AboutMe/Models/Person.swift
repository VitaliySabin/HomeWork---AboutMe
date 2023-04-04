//
//  Person.swift
//  HomeWork - AboutMe
//
//  Created by Виталий Сабин on 04.04.2023.
//

struct User {
    let username: String
    let password: String
    
    static func getUser() -> User {
        let user = User(username: "Alexey", password: "1111")
        return user
    }
}




struct Person {
    let name: String
    let surname: String
    
    let homeTown: String
    let dateOfBirth: String
    
    let occupation: String
    let speciality: String
    let university: String
    
    let biography: String
    
    static func getPerson() -> Person {
        let person = Person(
            name: "Vitaliy",
            surname: "Sabin",
            
            homeTown: "Kaluga",
            dateOfBirth: "11.01.1992",
            
            occupation: "M.D.",
            speciality: "Critical Care",
            university: "Yaroslavl State Medical University",
            
            biography: "Родился в Ярославле. Вырос и закончил школу в г. Кирове Калужской области. Учился в медицинском университете в Ярославле, получил специальность анестезиология-реаниматология. Сейчас живу и работаю в Калуге. Увлекаюсь настольными играми, их столько, что уже хранить негде. Заядлый болельщик. Слежу в футболе и баскетболе за Зенитом, в хоккее - за Авангардом. Также интересует барная культура. Люблю дома и для друзей миксовать коктейли."
        )
        
        return person
    }
}
