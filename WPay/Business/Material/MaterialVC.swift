//
//  MaterialVC.swift
//  WPay
//
//  Created by Weiwei on 2017/11/2.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

class MaterialVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
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
        
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = 70
        
        self.tableView.register(R.nib.materialListCell(), forCellReuseIdentifier: R.nib.materialListCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.materialListCell.identifier) as! MaterialListCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(MaterialSelectVC(), animated: true)
    }
}
