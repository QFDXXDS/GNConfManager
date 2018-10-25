//
//  ConfManager.swift
//  GN
//
//  Created by Xianxiangdaishu on 2018/10/25.
//  Copyright © 2018 XXDS. All rights reserved.
//

import Foundation

func handleArray(confArray: Array<Substring>) -> Array<DailyConfModel> {
    
    var DailyArray = [DailyConfModel(i: 0)]

    for item in confArray {
        
        if item.count == 0 {
            
            continue
        }
        
        let min: Substring = item.split(separator: " ").last!
        let minNumber: Int = getNumber(min: min)
       
        
        for model in DailyArray {
            
            if model.getItem(number: minNumber, item: item) {
                
                break
            }
            
//          到这个一步说明： item 没有被任何对象获取，所以新建一个对象
            if model === DailyArray.last {
                
                let  model = DailyConfModel(i: DailyArray.count)
                model.am.confList.append(String(item))
                DailyArray.append(model)
                break
            }
        }
    }
    
    return DailyArray
}


func getNumber(min: Substring) -> Int {
    
    var number: Int
    if min.hasSuffix("min") {
        
        number =  Int(String(min).dropLast(3))!
    } else {
        number = 5
    }
    return number
}
