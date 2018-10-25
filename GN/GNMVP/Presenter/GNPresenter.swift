//
//  GNVM.swift
//  GN
//
//  Created by Xianxiangdaishu on 2018/10/3.
//  Copyright © 2018 XXDS. All rights reserved.
//


import Foundation
import UIKit

class GNPresenter {
    
    weak var vc:GNTableVC?
    var tableArray = Array<Any>()

    init(v: GNTableVC) {
        
        
        vc = v
    }
    func getData(page: Int, size: Int) {
        
        let req = VMReq()
        req.type = 2
        req.page = page
        req.size = size
        
        GN.HTTPRequesgt(req: req).observeValues { (rsp) in
            
            self.tableArray = Model.wrraperData(object: rsp as! Dictionary<String, Any>)
            self.vc!.getData()
        }
    }
}
