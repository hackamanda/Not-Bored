//
//  Activity.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 09/09/22.
//

//import Foundation

struct Activity: Codable {
    let activityName: String
    let type: String
    let participants: Int
    let price: Double
    var priceCategory: String {
        switch price {
        case 0:
            return priceCategories.free.rawValue
        case 0...0.3:
            return priceCategories.low.rawValue
        case 0.3...0.6:
            return priceCategories.medium.rawValue
        default:
            return priceCategories.high.rawValue
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case activityName = "activity"
        case type = "type"
        case participants = "participants"
        case price = "price"
    }
}
