//
//  VMCell.swift
//  GN
//
//  Created by Xianxiangdaishu on 2018/10/16.
//  Copyright © 2018 XXDS. All rights reserved.
//

import UIKit

class VMCell: UITableViewCell {

    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var name: UILabel!
    
    var model = MutableProperty(Model())
    
    let vm = GNCellViewModel()
    
//    var model: Model? {
//
//        willSet {
//
//            guard model?.song_id == newValue?.song_id else {
//
//
//                return
//            }
//
//        }
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        title.reactive.text <~ vm.title
        name.reactive.text <~ vm.name
        imgView.reactive.image <~ vm.image
        vm.model <~ model
        
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
