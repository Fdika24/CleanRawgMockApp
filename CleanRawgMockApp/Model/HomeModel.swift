//
//  HomeModel.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 22/08/21.
//

import Foundation

struct HomeModelTopPicks:Codable {
    var next:String
    var results:[TopPick]
}

struct TopPick:Codable,Identifiable {
    var id:Int?
    var slug:String?
    var image:String?
    
    enum CodingKeys: String, CodingKey {
        case slug,id
        case image = "background_image"
    }
}

struct HomeModelBasic:Codable {
    var next:String
    var results:[BasicHome]
}

struct BasicHome:Codable,Identifiable {
    var id:Int?
    var slug:String
    var name:String?
    var released:String?
    var image:String?
    var rating:Double?
    var rank:Int?
    
    enum CodingKeys: String, CodingKey {
        case slug,name,released,rating,id
        case image = "background_image"
        case rank = "rating_top"
        }
}

