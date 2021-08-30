//
//  UserProfile.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 30/08/21.
//

import Foundation


class ProfileModel {
    static let nameKey = "name"
    static let emailKey = "email"
    static let professionKey = "profession"
    static let descKey = "desc"
    
    static var name: String {
        get {
            return UserDefaults.standard.string(forKey: nameKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: nameKey)
        }
    }
    
    static var email: String {
        get {
            return UserDefaults.standard.string(forKey: emailKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: emailKey)
        }
    }
    
    static var profession: String {
        get {
            return UserDefaults.standard.string(forKey: professionKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: professionKey)
        }
    }
    
    static var desc: String {
        get {
            return UserDefaults.standard.string(forKey: descKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue,forKey: descKey)
        }
    }
    
    static func synchronize() {
        UserDefaults.standard.synchronize()
    }
}
