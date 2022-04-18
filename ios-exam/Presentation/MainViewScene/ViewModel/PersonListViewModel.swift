//
//  PersonListViewModel.swift
//  ios-exam
//
//  Created by Deiner John Calbang on 4/18/22.
//

import Foundation

class PersonListViewModel: NSObject {
    
    var personLists = Observable<[Persons]>([])
    var errorFound = Observable<String>("")
    var page = 0
    var numberOfRows: Int {
        get {
            return personLists.value.count
        }
    }
    
    func fetchData() {
        
        NetworkManager.shared.getPersonListRequest(count: 20, included: .name, .dob, .email, .cell, .location, .gender, .picture, page: self.page) { persons in
            self.page += 1
            self.personLists.value.append(contentsOf: persons)
        } error: { err in
            self.errorFound.value = err.localizedDescription
        }

        
    }
    
    func getDataForEachRow(_ indexPath: IndexPath) -> Persons {
        return self.personLists.value[indexPath.row]
    }
    
}
