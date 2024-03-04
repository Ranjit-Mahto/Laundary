//
//  ServiceHandler.swift
//  Laundry
//
//  Created by Ranjit Mahto on 10/08/23.
//

import Foundation

struct endpoints {
    static let registerUser = "https://royalapi.sphota.tech/api/user/login/"
    static let profile = "https://royalapi.sphota.tech/api/user/profile/"
}

struct APIServiceHelper {
    
    func postData<T:Decodable>(requestUrl: URL, requestBody:Data ,resultType: T.Type, completionHandler: @escaping(_ result:T) -> Void) {
        
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json",forHTTPHeaderField:"content-type")
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if let responseData = data, responseData.count != 0 {
                do {
                    let response = try JSONDecoder().decode(T.self, from: responseData)
                    completionHandler(response)
                }catch let decodeError {
                    debugPrint("DecodeError", decodeError)
                }
            }
            /*if(data != nil && data?.count != 0){
                let response = String (data: data!, encoding: .utf8)
                debugPrint ("RESPONSE ===> ", response!)
            }*/
        }.resume()
        
    }
    
    func getData<T:Decodable>(requestUrl: URL, token:String, resultType: T.Type, completionHandler: @escaping(_ result:T) -> Void) {
        
        var urlRequest = URLRequest(url:requestUrl)
        //let token = userAccessToken
        urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpMethod = "get"
        
        URLSession.shared.dataTask(with: requestUrl) { (data, response, error) in
            
            if let responseData = data, responseData.count != 0 {
                do {
                    let result = try JSONDecoder().decode(T.self, from: responseData)
                    
                    completionHandler(result)
                }catch let decodeError {
                    debugPrint("DECODIND_ERROR", decodeError)
                }
            }
            
//            if(data != nil && data?.count != 0){
//                let response = String (data: data!, encoding: .utf8)
//                debugPrint ("RESPONSE ===> ", response!)
//            }
        }.resume()
    }

}
