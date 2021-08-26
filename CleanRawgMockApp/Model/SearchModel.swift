//
//  SearchModel.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 25/08/21.
//

import Foundation


struct Search:Codable {
    var next:String
    var results:[Result]
}

struct Result:Codable,Identifiable {
    var id = UUID()
    var slug:String?
    var name:String?
    var released:String?
    var image:String?
    var rating:Double?
    var rank:Int?
    
    enum CodingKeys: String, CodingKey {
        case slug,name,released,rating
        case image = "background_image"
        case rank = "rating_top"
        }
}
