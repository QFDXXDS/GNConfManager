//
//  GNCellVM.swift
//  GN
//
//  Created by Xianxiangdaishu on 2018/10/16.
//  Copyright © 2018 XXDS. All rights reserved.
//

import Foundation
import Kingfisher


class GNCellViewModel {
    

    var title = MutableProperty("")
    var name = MutableProperty("")
    var image = MutableProperty(UIImage.init())
    var model =  MutableProperty(Model())
    
    init() {
        
        model.signal.observeValues { (model) in
            
            self.title.value = model.title!
            self.name.value = model.artist_name!
            
        }
    }
    
    
}
