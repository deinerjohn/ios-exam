//
//  Persons.swift
//  ios-exam
//
//  Created by Deiner John Calbang on 4/18/22.
//

import Foundation

struct Persons: Codable {
    var name: Name?
    var dob: DateOfBirth?
    var email: String?
    var cell: String?
    var location: Location?
    var picture: Picture?
    var gender: String?
}

struct Name: Codable {
    var title: String?
    var first: String?
    var last: String?
}

struct DateOfBirth: Codable {
    var date: String?
    var age: Int?
}

struct Location: Codable {
    var street: Street?
    var city: String?
    var country: String?
    var coordinates: Coordinates?
}

struct Street: Codable {
    var number: Int?
    var name: String?
}

struct Coordinates: Codable {
    var latitude: String?
    var longitude: String?
}

struct Picture: Codable {
    var medium: String?
    var large: String?
    var thumbnail: String?
}


