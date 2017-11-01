//
//  ConfigManager.swift
//
//
//  Copyright © 2017 Sunfit. All rights reserved.
//

import UIKit
import Foundation

//MARK: NetWork
var baseHostURL =  URL(string: "\(baseHostIP)/2pGCgQSecbef9cd9c3b44b1a5ba71370f60dea22b6413f2?uri=")!

var baseHostIP =  "http://result.eolinker.com"

let jpushAppKey     = "a78f6187e9911e8523d45b34"
let jpushChannel    = "Publish channel"
let isProduction    = false
    
let uMengAppKey     = "599554c807fe6517b2000cd9"

//MARK: Color

let MainGolden = UIColor(red: 205/255, green: 172/255, blue: 110/255, alpha: 1)

//let MainGolden = UIColor(red: 205/255, green: 172/255, blue: 110/255, alpha: 1)



let screenWidth     = UIScreen.main.bounds.width
let screenHeight    = UIScreen.main.bounds.height




extension Notification.Name {
    
    static let InstanePurchaseBtnClicked    = Notification.Name("InstanePurchaseBtnClickedNoti")
    
    static let UserStatusHasChanged         = Notification.Name("UserStatusHasChangedNoti")
    
    static let InvestFinished               = Notification.Name("InvestFinishedNoti")
    
    
}




