//
//  ApplePurchaseVController.swift
//  51Fans
//
//  Created by WeiWei on 2017/10/11.
//  Copyright © 2017年 iLabs, Inc. All rights reserved.
//

import UIKit

class ApplePurchaseVController: UIViewController, IApRequestResultsDelegate {
    
    let productId = "CNY12"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.naviTitle = "内购支付"
        /**启动IAP工具类*/
        IAPManager.shared().start()
        
        IAPManager.shared().delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        IAPManager.shared().requestProduct(withId: productId)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        /**结束IAP工具类*/
        IAPManager.shared().stop()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func successed(withDict dict: [AnyHashable : Any]!) {
        
        var transactionReceiptString = String()
        for (key,value) in dict {
            
            print("key:",key)
            print("value:",value)
            
            if key as! String == "receipt_key" {
                
                transactionReceiptString = value as! String
                print("transactionReceiptString === ",transactionReceiptString)
            }
        }
        
        HUDView.showHud(title: "正在验证交易信息")
        
        IAPManager.shared().cleanReceiptData()
        _ = self.popoverPresentationController

        HUDView.hideHud()
    }
    
    func filedWithErrorCode(_ errorCode: Int, andError error: String!) {
        
        HUDView.hideHud()

        _ = self.popoverPresentationController
    }
    
    func showErrorAlert(detail: String) {
        
        let alertVC = UIAlertController(title: "失败", message: detail, preferredStyle: .alert)
        let close = UIAlertAction(title: "关闭", style: UIAlertActionStyle.default) { (UIAlertAction) -> Void in
            
        }
        alertVC.addAction(close)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func cancleBtnClicked(_ sender: Any) {
        
        _ = self.popoverPresentationController
    }
}
