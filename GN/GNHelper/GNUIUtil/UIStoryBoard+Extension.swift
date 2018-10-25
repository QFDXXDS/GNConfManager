//
//  UIStoryBoard+Extension.swift
//  GN
//
//  Created by Xianxiangdaishu on 2017/10/30.
//  Copyright © 2017年 XXDS. All rights reserved.
//

import Foundation
import UIKit


extension  UIStoryboard {
    
    
    class func viewcontroller(name:String, id:String) -> UIViewController {
        
        let buddle = Bundle(path:id) ;
        let VC = UIStoryboard(name: name,bundle: buddle).instantiateViewController(withIdentifier: id);
        return VC;
    }
}
