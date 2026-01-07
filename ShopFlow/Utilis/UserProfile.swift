//
//  UserProfile.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/12/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation

class UserProfile {
    static let shared = UserProfile()
    
    var isRemember: Bool{
        set{
            UserDefaults.standard.set(newValue, forKey: "remember")
            UserDefaults.standard.synchronize()
        }get{
            return UserDefaults.standard.bool(forKey: "remember")
        }
    }
    
    var accessToken: String{
        set{
            UserDefaults.standard.set(newValue, forKey: "accessToken")
            UserDefaults.standard.synchronize()
        }get{
            return UserDefaults.standard.string(forKey: "accessToken") ?? ""
        }
    }
    
    var profile: User?{
        set{
            let userDefaults = UserDefaults.standard
            let data = NSKeyedArchiver.archivedData(withRootObject: newValue)
            userDefaults.set(data, forKey: "Profile")
            userDefaults.synchronize()
        }get{
            if let data = UserDefaults.standard.data(forKey: "Profile"), let user = NSKeyedUnarchiver.unarchiveObject(with: data) as? User{
                return user
            }
            return nil
        }
    }
    var activities: [ConstantsCategory]?{
        set{
            let userDefaults = UserDefaults.standard
            let data = NSKeyedArchiver.archivedData(withRootObject: newValue)
            userDefaults.set(data, forKey: "activity")
            userDefaults.synchronize()
        }get{
            if let data = UserDefaults.standard.data(forKey: "activity") , let activity = NSKeyedUnarchiver.unarchiveObject(with: data) as? [ConstantsCategory]{
                return activity
            }
            return nil
        }
    }
    
    var categories: [ConstantsCategory]?{
        set{
            let userDefaults = UserDefaults.standard
            let data = NSKeyedArchiver.archivedData(withRootObject: newValue)
            userDefaults.set(data, forKey: "Categories")
            userDefaults.synchronize()
        }get{
            if let data = UserDefaults.standard.data(forKey: "Categories") , let category = NSKeyedUnarchiver.unarchiveObject(with: data) as? [ConstantsCategory]{
                return category
            }
            return nil
        }
    }
    var ads: [ConstantsAd]?{
        set{
            let userDefaults = UserDefaults.standard
            let data = NSKeyedArchiver.archivedData(withRootObject: newValue)
            userDefaults.set(data, forKey: "ads")
            userDefaults.synchronize()
        }get{
            if let data = UserDefaults.standard.data(forKey: "ads") , let ads = NSKeyedUnarchiver.unarchiveObject(with: data) as? [ConstantsAd]{
                return ads
            }
            return nil
        }
    }
    var slider: [String]?{
        set{
            let userDefaults = UserDefaults.standard
            let data = NSKeyedArchiver.archivedData(withRootObject: newValue)
            userDefaults.set(data, forKey: "slider")
            userDefaults.synchronize()
        }get{
            if let data = UserDefaults.standard.data(forKey: "slider") , let slider = NSKeyedUnarchiver.unarchiveObject(with: data) as? [String]{
                return slider
            }
            return nil
        }
    }
    var offer: Offer?{
        set{
            let userDefaults = UserDefaults.standard
            let data = NSKeyedArchiver.archivedData(withRootObject: newValue)
            userDefaults.set(data, forKey: "Offer")
            userDefaults.synchronize()
        }get{
            if let data = UserDefaults.standard.data(forKey: "Offer"), let offer = NSKeyedUnarchiver.unarchiveObject(with: data) as? Offer{
                return offer
            }
            return nil
        }
    }
    var homePageCategories: [HomePageCategories]?{
        set{
            let userDefaults = UserDefaults.standard
            let data = NSKeyedArchiver.archivedData(withRootObject: newValue)
            userDefaults.set(data, forKey: "homePageCategories")
            userDefaults.synchronize()
        }get{
            if let data = UserDefaults.standard.data(forKey: "homePageCategories") , let homePageCategories = NSKeyedUnarchiver.unarchiveObject(with: data) as? [HomePageCategories]{
                return homePageCategories
            }
            return nil
        }
    }
    var ShopFlowProducts: [ShopFlowProducts]?{
        set{
            let userDefaults = UserDefaults.standard
            let data = NSKeyedArchiver.archivedData(withRootObject: newValue)
            userDefaults.set(data, forKey: "ShopFlowProducts")
            userDefaults.synchronize()
        }get{
            if let data = UserDefaults.standard.data(forKey: "ShopFlowProducts") , let ShopFlowProducts = NSKeyedUnarchiver.unarchiveObject(with: data) as? [ShopFlowProducts]{
                return ShopFlowProducts
            }
            return nil
        }
    }
    var viewStore: ViewStores?{
           set{
               let userDefaults = UserDefaults.standard
               let data = NSKeyedArchiver.archivedData(withRootObject: newValue)
               userDefaults.set(data, forKey: "ViewStores")
               userDefaults.synchronize()
           }get{
               if let data = UserDefaults.standard.data(forKey: "ViewStores"), let viewStores = NSKeyedUnarchiver.unarchiveObject(with: data) as? ViewStores{
                   return viewStores
               }
               return nil
           }
    }
    func isUserLogin() -> Bool {
        return  self.isRemember != false
    }
}
