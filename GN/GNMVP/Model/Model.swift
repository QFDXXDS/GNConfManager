//
//  MSRecommendModel.swift
//  GN
//
//  Created by Xianxiangdaishu on 2018/3/2.
//  Copyright © 2018年 XXDS. All rights reserved.
//

import UIKit

struct  Model: GNHandyJSON {
    
    var title : Any?
    var song_id : Any?
    var artist_name : Any?
    var pic_big : Any?
    var hot : Any?
    var file_duration : Any?

    
    static  func wrraperData(object: Dictionary<String,Any>) -> Array<Any> {
        
        let arr :Array<Any> = object["song_list"] as! Array
        var temp = [Any]()
        
        for dic in arr {
            
            let dic1 = dic as! Dictionary<String, Any>
            let model = Model.deserialize(from: dic1)
            temp.append(model as Any)
        }
        return temp
    }
}


