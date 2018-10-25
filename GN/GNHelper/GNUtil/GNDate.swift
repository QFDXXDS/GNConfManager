//
//  GNDate.swift
//  GN
//
//  Created by Xianxiangdaishu on 2018/10/25.
//  Copyright © 2018 XXDS. All rights reserved.
//

import Foundation

class GNDate {
    
    static let  ma = GNDate()
    private init() {
        
    }

    
    var minForMater: DateFormatter  = {
        
            let df = DateFormatter()
            df.dateFormat = "hh:mm"
        return df
        }()
    var DayForMater: DateFormatter  = {
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return df
    }()
    
    class func getTime(date: Date) -> String {
        
      return  ma.minForMater.string(from: date)
    }
    
    class func getAM_PM(time: String) -> Date {
        
        var  d = ma.DayForMater.string(from: Date.init())
        
        let startIndex = d.index(d.startIndex, offsetBy: 11)
        let endIndex = d.index(d.startIndex, offsetBy: 15)

        d.replaceSubrange(startIndex...endIndex, with: time)
        return  ma.DayForMater.date(from: d)!
    }

}
