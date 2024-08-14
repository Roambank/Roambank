//
//  SignInWithAppleViewModel.swift
//  Roambank
//
//  Created by Lisandra Nicoline on 29/07/24.
//

import Foundation

@Observable
class SignInWithAppleViewModel {
    var user: User
    var addUserResponseData: AddUserResponseData
    var getUsersResponseData: GetUsersResponseData
    
    init() {
        self.user = User(id: UUID(), nama: "", noHP: "", alamat: "", email: "")
        self.addUserResponseData = AddUserResponseData(code: 0, desc: "")
        self.getUsersResponseData = GetUsersResponseData(code: 0, desc: "", userData: User(nama: "", noHP: "", alamat: "", email: ""))
    }
    
    func addUser(newUser: User) {
        guard let url = URL(string: Const.baseURL) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let requestData = AddUserRequestData(feature: Const.addUserEP, userData: newUser)
            let jsonData = try JSONEncoder().encode(requestData)
            print(String(data: jsonData, encoding: .utf8) ?? "")
            request.httpBody = jsonData
            
            let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Request Error: ", error)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else { return }
                
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let decodedData = try JSONDecoder().decode(AddUserResponseData.self, from: data)
                        self.addUserResponseData = decodedData
                    }
                    catch let error {
                        print("Error Decoding:", error)
                    }
                }
            }
            
            dataTask.resume()
        } catch let error {
            print("Error Request:", error)
        }
    }
    
    func getUserData(userId: Int) {
        guard let url = URL(string: Const.baseURL) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let requestData = GetUsersRequestData(feature: Const.getUserBasedOnIdEP, userId: userId)
            let jsonData = try JSONEncoder().encode(requestData)
            print(String(data: jsonData, encoding: .utf8) ?? "")
            request.httpBody = jsonData
            
            let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Request Error: ", error)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else { return }
                
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        print(String(data: data, encoding: .utf8) ?? "")
                        let decodedData = try JSONDecoder().decode(GetUsersResponseData.self, from: data)
                        self.getUsersResponseData = decodedData
                    }
                    catch let error {
                        print("Error Decoding:", error)
                    }
                }
            }
            
            dataTask.resume()
        } catch let error {
            print("Error Request:", error)
        }
    }
}

