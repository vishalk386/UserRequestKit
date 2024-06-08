//
//  APIManager.swift
//
//
//  Created by Vishal Kamble on 08/06/24.
//

import Foundation
import Alamofire

class APIManager {
    private let baseURL = "https://reqres.in/api/users"
    static let shared = APIManager()
    
    private init() {}
    
    func getUsers(page: Int, completion: @escaping (Result<[User], Error>) -> Void) {
        let parameters: [String: Any] = ["page": page]
        
        AF.request(baseURL, method: .get, parameters: parameters)
            .validate()
            .responseDecodable(of: UserListResponse.self) { (response: DataResponse<UserListResponse, AFError>) in
                switch response.result {
                case .success(let responseData):
                    completion(.success(responseData.data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
