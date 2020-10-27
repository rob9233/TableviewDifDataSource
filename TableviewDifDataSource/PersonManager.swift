//
//  PersonManager.swift
//  TableviewDifDataSource
//
//  Created by Roberto Fernandes on 27/10/2020.
//

import Foundation

struct PersonManager {
    
    static var persons: [Person] { [
        "Lavonne Behan",
        "Rocky Pelton",
        "Kimberley Zylstra",
        "Elza Junge",
        "Ava Frix",
        "Drucilla Ozment",
        "Oscar Mcclendon",
        "Margurite Hoyte",
        "Maddie Cowie",
        "Inell Hanzlik",
        "Melita Hodges",
        "Else Lafave",
        "Candi Segura",
        "Marianna Mcmains",
        "Lona Giunta",
        "Randa Wilford",
        "Tabetha Sumler",
        "Edward Winbush",
        "Nikia Riss",
        "Lasonya Giammarino",
        "Xavier Teneyck",
        "Pierre Whitner",
        "Raul Deen",
        "Therese Coster",
        "Rey Ebinger",
        "Ronna Cada",
        "Holly Mccully",
        "Kelley Vetter",
        "Allie Corey",
        "Ervin Shea",
        "Leanne Fletcher",
        "Veronika Blowers",
        "Syreeta Urbanek",
        "Regenia Hohler",
        "Melissa Acord",
        "Antony Meigs",
        "Verdell Lavoie",
        "Liz Lail",
        "Twila Gaulke",
        "Garland Cork",
        "Riva Delmont",
        "Derick Yarman",
        "Princess Hanberry",
        "Glynda Mullings",
        "Annette Fortman",
        "Jannet Lineman",
        "Marin Piekarski",
        "Dalia Taylor",
        "Cassi Buth",
        "Hildred Devin"].map{(name) -> Person in
            Person(name: name, age: Int.random(in: 1...99))
        }
    }
}
