//
//  Service.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 02/12/21.
//

import Foundation

class Service {
    // MARK: Properties
    var shouldShowProgressScreen: ((Bool) -> Void)?
    var shouldShowHome: (() -> Void)?
    
    // MARK: Methods
    func loginUser(login: String, password: String, completion: @escaping ((UserModel?, String?) -> Void)) {
        shouldShowProgressScreen?(true)
        let json: [String: Any] = ["login": login,
                                   "password": password]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        if let url = URL(string: "https://api-desafios-usemobile.herokuapp.com/auth") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    let error = error?.localizedDescription ?? "==> Error: No data"
                    completion(nil, error)
                    return
                }
                if let jsonResponse = try? JSONDecoder().decode(UserModel.self, from: data) {
                    self?.shouldShowProgressScreen?(false)
                    print("==> Success decoding JSON: \(jsonResponse)")
                    completion(jsonResponse, nil)
                } else {
                    let error = "==> Error: JSON could not be decoded to model"
                    completion(nil, error)
                }
            }
            task.resume()
        }
    }
}
