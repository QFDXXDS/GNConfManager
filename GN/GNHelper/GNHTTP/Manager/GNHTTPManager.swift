//
//  GNHTTPManager.swift
//  GN
//
//  Created by Xianxiangdaishu on 2018/9/21.
//  Copyright © 2018年 XXDS. All rights reserved.
//

import Foundation
import Alamofire


func HTTPRequesgt(req: GNHTTPReq) -> GNSignal<Any, GNNoError > {
    
    let (signal,ob) = GNSignal<Any, GNNoError>.pipe()
    Alamofire.request(req.URLStr(), method: req.reqMethod(), parameters: req.parameters()).responseJSON { (rsp) in
        
        switch rsp.result {
            
            case .success(let value):
            
                ob.send(value:value )
                break
            
            case .failure(let fail):
                
                NotificationCenter.default.post(name: kHTTPFAil, object: fail.localizedDescription)
                break
            }
        ob.sendCompleted()
    }
    return signal
}

