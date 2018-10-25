//
//  Const.swift
//  GN
//
//  Created by Xianxiangdaishu on 2017/10/30.
//  Copyright © 2017年 XXDS. All rights reserved.
//

import Foundation
import UIKit


@_exported import Result
@_exported import ReactiveCocoa
@_exported import ReactiveSwift

@_exported import Alamofire

import Kingfisher
import SwiftyJSON
import HandyJSON
import PKHUD



typealias GNSignal = Signal
typealias GNProducer = SignalProducer
typealias GNNoError = NoError

typealias GNJSON = JSON
typealias GNHandyJSON = HandyJSON
typealias GNHUD = HUD
typealias GNHUDContentType = HUDContentType



let kScreenHeight = UIScreen.main.bounds.size.height

let kScreenWidth = UIScreen.main.bounds.size.width

let kHTTPFAil = NSNotification.Name.init("HTTPFAil")
