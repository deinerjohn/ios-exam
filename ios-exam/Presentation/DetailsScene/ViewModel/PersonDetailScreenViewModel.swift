//
//  PersonDetailScreenViewModel.swift
//  ios-exam
//
//  Created by Deiner John Calbang on 4/18/22.
//

import Foundation

class PersonDetailScreenViewModel {
    
    var personDetails: Observable<Persons?> = Observable(nil)
    
    init(person: Persons) {
        self.personDetails.value = person
    }
    
    func composeFullName(_ name: Name?) -> String {
        guard let name = name, let firstName = name.first, let lastName = name.last  else {
            return "First Name Last Name"
        }

        return firstName + " " + lastName
    }
    
    func fullAddressCompose(_ location: Location?) -> String {
        guard let location = location, let number = location.street?.number, let name = location.street?.name, let city = location.city, let country = location.country else {
            return ""
        }
        
        return "\(String(number)) \(name), \(city), \(country)"
    }
    
    func getCoordinates(_ location: Location?) -> (Double, Double) {
        guard let location = location, let lat = location.coordinates?.latitude, let long = location.coordinates?.longitude else {
            return (0,0)
        }
        let latitude = Double(lat) ?? 0.0
        let longitude = Double(long) ?? 0.0
        return (latitude, longitude)
    }
    
}
