//
//  ViewController.swift
//  WPay
//
//  Created by WeiWei on 2017/10/20.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func iapBtnClicked(_ sender: Any) {
        
<<<<<<< HEAD:WPay/ViewController.swift
        self.navigationController?.pushViewController(ApplePurchaseVController(), animated: true)
=======
        self.navigationController?.pushViewController(MaterialVC(), animated: true)
>>>>>>> 5b433ced8262babab8ad58f996dcd4a5c5078087:WPay/Business/MainPay/ViewController.swift
    }
    
    @IBAction func alipayBtnClicked(_ sender: Any) {
        
        AliPayManager.createOrder(userId: "",amount: "0.01", remark: "测试")
    }
}

