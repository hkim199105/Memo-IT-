//
//  UserInfoManager.swift
//  MyMemory
//
//  Created by hkim on 2019. 2. 26..
//  Copyright © 2019년 hkim. All rights reserved.
//

import Foundation

struct UserInfoKey {
    static let signedId = "SIGNEDID"
    static let account  = "ACCOUNT"
    static let name     = "NAME"
    static let profile  = "PROFILE"
    static let tutorial = "TUTORIAL"
}

class UserInfoManager {
    var signedId: Int {
        get {
            return UserDefaults.standard.integer(forKey: UserInfoKey.signedId)
        }
        set(v) {
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.signedId)
            ud.synchronize()
        }
    }
    
    var account: String? {
        get {
            return UserDefaults.standard.string(forKey: UserInfoKey.account)
        }
        set(v) {
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.account)
            ud.synchronize()
        }
    }
    
    var name: String? {
        get {
            return UserDefaults.standard.string(forKey: UserInfoKey.name)
        }
        set(v) {
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.name)
            ud.synchronize()
        }
    }
    
    var profile: UIImage? {
        get {
            let ud = UserDefaults.standard
            if let _profile = ud.data(forKey: UserInfoKey.profile) {
                return UIImage(data: _profile)
            } else {
                return UIImage(named: "imgProfile.jpg")
            }
        }
        set(v) {
            if v != nil {
                let ud = UserDefaults.standard
                ud.set(v?.pngData(), forKey: UserInfoKey.profile)
                ud.synchronize()
            }
        }
    }
    
    var isSigned: Bool {
        if self.signedId == 0 || self.account == nil {
            return false
        } else {
            return true
        }
    }
    
    func signIn(account: String, passwd: String) -> Bool {
        if account == "hkim199105@gmail.com" && passwd == "1234" {
            let ud = UserDefaults.standard
            ud.set(100, forKey: UserInfoKey.signedId)
            ud.set(account, forKey: UserInfoKey.account)
            ud.set("hkim", forKey: UserInfoKey.name)
            ud.synchronize()
            return true
        } else {
            return false
        }
    }
    
    func signOut() -> Bool {
        let ud = UserDefaults.standard
        ud.removeObject(forKey: UserInfoKey.name)
        ud.removeObject(forKey: UserInfoKey.account)
        ud.removeObject(forKey: UserInfoKey.profile)
        ud.synchronize()
        
        return true
    }           
}
