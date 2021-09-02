//
//  ItemDisplayModel.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 30/08/21.
//s

import Foundation

public struct ItemPreviewModel:Codable {
    var id:Int?
    var slug:String?
    var name:String?
    var image:String?
    var released:String?
    var desc:String?
    var rating:Float?
    //var developers:[developer]?
   //var genres:[genre]?
    var rank:Int?
    
    enum CodingKeys: String, CodingKey {
        case name,rating,released,id,slug
        case desc = "description_raw"
        case image = "background_image"
        case rank = "rating_top"
    }
    
}

public struct developer:Codable,Identifiable{
    public var id:Int?
    public var name:String?
}

public struct genre:Codable,Identifiable {
    public var id:Int?
    public var name:String?
}
