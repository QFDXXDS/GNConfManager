//
//  DailyConfModel.swift
//  GN
//
//  Created by Xianxiangdaishu on 2018/10/24.
//  Copyright © 2018 XXDS. All rights reserved.
//

import Foundation


fileprivate let AM_TotalTime = 180
fileprivate let PM_TotalTime = 240

fileprivate let AM_Time = "09:00"
fileprivate let PM_Time = "01:00"

fileprivate let AM_ENDTime = "12:00"
fileprivate let PM_ENDTime = "05:00"

fileprivate let AM = "上午"
fileprivate let PM = "下午"


class DailyConfModel  {
    
    let am = AMPMModel(AM_TotalTime,AM_Time)
    var pm = AMPMModel(PM_TotalTime,PM_Time)
    let title:String

    init(i: Int) {
        
        title = "第\(i + 1)天"
        am.confList.append(AM)
        pm.confList.append(PM)
        
        
        
//        let dic = Dictionary.init(grouping: plan) { $0.split(separator: " ").last! }

//        print(dic)
        
//        [Optional("45min"): ["Overdoing it in Python 45min", "Ruby Errors from Mismatched Gem Versions 45min", "Common Ruby Errors 45min", "Accounting-Driven Development 45min", "Pair Programming vs Noise 45min", "Clojure Ate Scala (on my project) 45min"], 6
//         Optional("60min"): ["Writing Fast Tests Against Enterprise Rails 60min", "Communicating Over Distance 60min", "Rails Magic 60min", "Ruby on Rails: Why We Should Move On 60min", "Ruby on Rails Legacy App Maintenance 60min"],5
//         Optional("30min"): ["Lua for the Masses 30min", "Woah 30min", "Sit Down and Write 30min", "Programming in the Boondocks of Seattle 30min", "Ruby vs. Clojure for Back-End Development 30min", "A World Without HackerNews 30min", "User Interface CSS in Rails Apps 30min"]] 7
//
//        Optional("lightning"): ["Rails for Python Developers lightning"], 1

    }
    
}

extension  DailyConfModel{
    
    func getItem(number: Int, item: Substring ) -> Bool {
        
        return am.getItem(number:number, item: item) || pm.getItem(number:number, item: item)
    }
}

class AMPMModel {
    
    var currentTime: Int = 0
    var confList = [String]()
    let totalTime: Int
    var date: Date
    
    init(_ totalTime: Int, _ time: String) {
        
        self.totalTime = totalTime
        date = GNDate.getAM_PM(time: time)
    }
    
    func getItem(number: Int, item: Substring ) -> Bool {
    
        currentTime += number
        if currentTime <= totalTime {
            
            if confList.first == AM {
                
                confList.append(GNDate.getTime(date: date) + "AM " + String(item))
                
                if currentTime >=  (totalTime - 30) {
                    
                    date = GNDate.getAM_PM(time: AM_ENDTime)
                    confList.append(GNDate.getTime(date: date) + " " + "Lunch")
                    
                }
            }
            if confList.first == PM {
            
                confList.append(GNDate.getTime(date: date) + "PM " + String(item))
                
                if currentTime >=  (totalTime - 30) {
                    
                    
                    date = Date.init(timeInterval: TimeInterval(number*60), since: self.date)
                    confList.append(GNDate.getTime(date: date) +  "PM " + "Networking Event")
                }
            }
            date = Date.init(timeInterval: TimeInterval(number*60), since: self.date)

            
            return true
        } else {
            currentTime -= number
            
        }
        return false
    }
}
