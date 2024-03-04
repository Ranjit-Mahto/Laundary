//
//  LaundrayInfo.swift
//  Laundry
//
//  Created by Ranjit Mahto on 10/08/23.
//

import Foundation


struct LaundryInfo {
    
    var imageurl: String
    var title : String
    var details : String
    var price : String
    
}

struct HomeData {
    
    func all() -> [LaundryInfo] {
        
        var allInfo: [LaundryInfo] = [LaundryInfo]()
        
        allInfo.append(LaundryInfo(imageurl:"iron-cloth", title: "DryClean", details: "Affordable laundry service", price: "60.00/kg"))
        allInfo.append(LaundryInfo(imageurl:"iron-towels", title: "Wash and Iron", details: "The shine that metters", price:"120.00/kg"))
        allInfo.append(LaundryInfo(imageurl:"iron-cloth", title: "DryClean", details: "Affordable laundry service", price: "60.00/kg"))
        allInfo.append(LaundryInfo(imageurl:"iron-towels", title: "Wash and Iron", details: "The shine that metters", price:"120.00/kg"))
        return allInfo
    }
}
