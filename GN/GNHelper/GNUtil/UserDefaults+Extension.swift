//
//  UserDefaults+Extension.swift
//  GN
//
//  Created by Xianxiangdaishu on 2017/10/30.
//  Copyright © 2017年 XXDS. All rights reserved.
//

import Foundation

extension UserDefaults {

    class  func setObject(object: Any?,  key: String) {
        
        let def = UserDefaults.standard
        def.set(object, forKey: key)
        def.synchronize()
    }
    class func getObject(key:String) -> Any? {
        
        let def = UserDefaults.standard
        let value:Any? = def.object(forKey: key)
        return value
    }
    
}
