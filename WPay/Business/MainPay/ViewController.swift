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
        
        self.navigationController?.pushViewController(DesignerProductDetailVC(), animated: true)
    }
    
    @IBAction func alipayBtnClicked(_ sender: Any) {
        
        AliPayManager.createOrder(userId: "",amount: "0.01", remark: "测试")
    }
}

