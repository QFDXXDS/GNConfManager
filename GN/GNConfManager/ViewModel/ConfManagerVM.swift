//
//  ConfManagerVM.swift
//  GN
//
//  Created by Xianxiangdaishu on 2018/10/24.
//  Copyright © 2018 XXDS. All rights reserved.
//

import Foundation

class ConfManagerVM {
    
    var tableArray = [DailyConfModel]()
    
    func loadData(fileName: String) -> GNSignal<Any,NoError>  {
        
        let (signal,observer) = GNSignal<Any,NoError>.pipe()
        
        let path = Bundle.main.path(forResource: "会议计划", ofType: "txt")
        let confPlan = try? String.init(contentsOfFile: path!)
        let confArray: Array<Substring> = confPlan!.split(separator: "\n")
        
        QueueScheduler.init(qos: .background, name: "handle", targeting: nil).schedule {
            
            self.tableArray = GN.handleArray(confArray: confArray)
            UIScheduler.init().schedule {
                
                observer.sendCompleted()
            }
        }
        return signal
    }

}
