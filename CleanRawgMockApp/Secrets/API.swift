//
//  API.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 22/08/21.
//

import Security
import Foundation

public struct Api {
    public var link = URLComponents(string: "https://api.rawg.io/api/")
    public let key = "93f06e41c9e14a73827ae756b20773ab"
}



//MARK: Work on Progress
/*
public class myAPI {
    var ref: AnyObject?
    let Api = [
        kSecValueData: "93f06e41c9e14a73827ae756b20773ab".data(using: .utf8)!,
        kSecAttrServer: "https://api.rawg.io/api/",
        kSecClass: kSecClassGenericPassword,
        kSecReturnData:true
    ] as CFDictionary
    let status = SecItemAdd(Api, &ref)
}

let keychainItem = [
  kSecValueData: "Pullip2020".data(using: .utf8)!,
  kSecAttrAccount: "andyibanez",
  kSecAttrServer: "pullipstyle.com",
  kSecClass: kSecClassInternetPassword,
  kSecReturnAttributes: true
] as CFDictionary

var ref: AnyObject?

let Api = [
    kSecValueData: "93f06e41c9e14a73827ae756b20773ab".data(using: .utf8)!,
    kSecAttrServer: "https://api.rawg.io/api/",
    kSecClass: kSecClassGenericPassword,
    kSecReturnData:true
] as CFDictionary

let status = SecItemAdd(keychainItem, &ref)
let result = ref as! NSDictionary
*/
