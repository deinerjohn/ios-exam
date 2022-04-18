//
//  RandomPersonResponse.swift
//  ios-exam
//
//  Created by Deiner John Calbang on 4/18/22.
//

import Foundation

struct RandomPersonResponse: Codable {
    var results: [Persons]?
    var info: Info?
}


struct Info: Codable {
    var seed: String?
}
