//
//  UserProfileResponse.swift
//  Laundry
//
//  Created by Ranjit Mahto on 10/08/23.
//

import Foundation

struct UserProfileResponse: Decodable {
    
  var city: String?
  var address: String?
  var lastName: String?
  var empID: String?
  var id: Int?
  var phone2: String?
  var country: String?
  var phone1: String?
  var state: String?
  var firstName: String?
  var email: String?
  var entityCode: String?
  
  enum CodingKeys: String, CodingKey {
    case city
    case address
    case lastName = "last_name"
    case empID = "emp_id"
    case id
    case phone2
    case country
    case phone1
    case state
    case firstName = "first_name"
    case email
    case entityCode = "EntityCode"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    city = try container.decodeIfPresent(String.self, forKey: .city)
    address = try container.decodeIfPresent(String.self, forKey: .address)
    lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
    empID = try container.decodeIfPresent(String.self, forKey: .empID)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    phone2 = try container.decodeIfPresent(String.self, forKey: .phone2)
    country = try container.decodeIfPresent(String.self, forKey: .country)
    phone1 = try container.decodeIfPresent(String.self, forKey: .phone1)
    state = try container.decodeIfPresent(String.self, forKey: .state)
    firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
    email = try container.decodeIfPresent(String.self, forKey: .email)
    entityCode = try container.decodeIfPresent(String.self, forKey: .entityCode)
  }

}
