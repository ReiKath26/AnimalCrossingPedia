//
//  Availability.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 04/02/23.
//

import Foundation

struct Availability: Codable
{
    let location: String
    let rarity: String
    let monthNorthern: [Int]
    let monthSouthern: [Int]
    let time: [Int]
    
    enum CodingKeys: String, CodingKey
    {
        case location = "location"
        case rarity = "rarity"
        case monthNorthern = "month-array-northern"
        case monthSouthern = "month-array-southern"
        case time = "time-array"
    }
}
