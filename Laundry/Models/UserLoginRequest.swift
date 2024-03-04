//
//  UserLoginRequest.swift
//  Laundry
//
//  Created by Ranjit Mahto on 10/08/23.
//

import Foundation

struct UserLoginRequest : Encodable {
    let userEmail : String
    let userPass : String
    
    enum CodingKeys : String, CodingKey {
        case userEmail = "email"
        case userPass = "password"
    }
    
        //"email": "employee9@gmail.com",
        //"password": "sasidal@123"
}
