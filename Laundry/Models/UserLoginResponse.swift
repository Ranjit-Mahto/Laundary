//
//  UserLoginResponse.swift
//  Laundry
//
//  Created by Ranjit Mahto on 10/08/23.
//

import Foundation

struct UserLoginResponse: Decodable {
    
  var message: String?
  var token: Token?
  
  enum CodingKeys: String, CodingKey {
    case message
    case token
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    message = try container.decodeIfPresent(String.self, forKey: .message)
    token = try container.decodeIfPresent(Token.self, forKey: .token)
  }
}

// MARK: - Token
struct Token: Decodable {
    
  var refresh: String?
  var access: String?
  
  enum CodingKeys: String, CodingKey {
    case refresh
    case access
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    refresh = try container.decodeIfPresent(String.self, forKey: .refresh)
    access = try container.decodeIfPresent(String.self, forKey: .access)
  }
    
}
