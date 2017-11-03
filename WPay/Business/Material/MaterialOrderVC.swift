//
//  MaterialOrderVC.swift
//  WPay
//
//  Created by WeiWei on 2017/11/3.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

class MaterialOrderVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    let dataArr = Array<String>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initSubviews() {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.estimatedRowHeight = 100
        
        self.tableView.register(R.nib.materialOrderCell(), forCellReuseIdentifier: R.nib.materialOrderCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.materialOrderCell.identifier) as! MaterialOrderCell
        
        cell.btnClickedClosure = {[weak self] order in
            
            self?.comfirmReceipt(order: order)
        }
        
        return cell
    }
    
    func comfirmReceipt(order: String) {
        
        self.navigationController?.pushViewController(CommentVC(), animated: true)
    }
}
