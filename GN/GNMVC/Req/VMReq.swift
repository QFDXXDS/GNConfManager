//
//  MSRecommendReq.swift
//  GN
//
//  Created by Xianxiangdaishu on 2018/2/27.
//  Copyright © 2018年 XXDS. All rights reserved.
//


fileprivate  let MS_LIST_URL = "http://tingapi.ting.baidu.com/v1/restserver/ting?"


import UIKit

  class VMReq: MSReq {

   let limits = 50
   let order = 1
   let page_no = 1
    var page: Int?
    var size: Int?
    
   override func URLStr() -> String {

        return MS_LIST_URL
    }
}



