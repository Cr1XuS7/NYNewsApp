//
//  News.swift
//  NYNewsApp--CodingChallenge--ChristopherBoyajian
//
//  Created by Christopher Boyajian on 22/07/2022.
//

import Foundation

struct Root : Codable {
    let results : [Results]
    
}
struct Results : Codable , Identifiable{
    
    let title : String
    let id : Int
    let byline : String
    let published_date : String
    let url : String
    
}
