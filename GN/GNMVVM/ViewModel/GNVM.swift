//
//  GNVM.swift
//  GN
//
//  Created by Xianxiangdaishu on 2018/10/3.
//  Copyright © 2018 XXDS. All rights reserved.
//

import Foundation


class GNVM {
    
    var tableArray = Array<Any>()
    @discardableResult

    func getData(page: Int, size: Int) -> GNSignal<Any, GNNoError> {

        let req = VMReq()
        req.type = 2
        req.page = page
        req.size = size
        let (signal,ob) = GNSignal<Any, GNNoError>.pipe()

        GN.HTTPRequesgt(req: req).observeValues { (rsp) in
            self.tableArray = Model.wrraperData(object: rsp as! Dictionary<String, Any>)
            ob.sendCompleted()
        }
        return signal
    }
}
