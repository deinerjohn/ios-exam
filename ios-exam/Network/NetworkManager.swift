//
//  NetworkManager.swift
//  ios-exam
//
//  Created by Deiner John Calbang on 4/18/22.
//

import Foundation
import Alamofire

enum PersonDetailsInclusion: String {
    case name = "name, "
    case dob = "dob, "
    case email = "email, "
    case cell = "cell, "
    case location = "location, "
    case picture = "picture, "
    case gender = "gender, "
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
   private var kRandomBaseUrl: String {
        guard let url = Bundle.main.infoDictionary?["RANDOM_BASE_URL"] as? String else {
            return ""
        }
        return url
    }
    
    private let session: Session = {
        let config = URLSessionConfiguration.af.default
        config.requestCachePolicy = .returnCacheDataElseLoad
        return Session(configuration: config)
    }()
    
    func getPersonListRequest(count: Int, included: PersonDetailsInclusion..., page: Int, completion: @escaping ([Persons]) -> Void, error: @escaping(Error) -> Void) {
        
        let params: [String:Any] = [
            "results": count,
            "inc": self.incStringComposer(included),
            "page": page
        ]
        
        self.commonRequest(params: params) { result in
            switch result {
            case .success(let data):
                completion(data.results ?? [])
            case .failure(let err):
                error(err)
            }
        }
    }
    private func commonRequest(params: [String:Any], completion: @escaping (Result<RandomPersonResponse, Error>) -> Void) {
        session.request(kRandomBaseUrl, parameters: params).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decode = try JSONDecoder().decode(RandomPersonResponse.self, from: data)
                    completion(.success(decode))
                }catch {
                    completion(.failure(NSError(domain: "", code: response.response?.statusCode ?? 404, userInfo: nil)))
                }
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
    private func incStringComposer(_ included: [PersonDetailsInclusion]) -> String {
        var inc = ""
        
        if included.count == 0 {
            inc = ""
        }else {
            for i in included {
                inc.append(i.rawValue)
            }
        }
        
        return inc
        
    }
    
}
