//
//  MaterialSelectVC.swift
//  WPay
//
//  Created by WeiWei on 2017/11/3.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

class MaterialSelectVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        
        self.tableView.rowHeight = 55
        
        self.tableView.register(R.nib.materialItemCell(), forCellReuseIdentifier: R.nib.materialItemCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.materialItemCell.identifier) as! MaterialItemCell
        
        return cell
    }
    
    @IBAction func ensureBtnClicked(_ sender: Any) {
        
        self.navigationController?.pushViewController(MaterialOrderVC(), animated: true)
    }
}
