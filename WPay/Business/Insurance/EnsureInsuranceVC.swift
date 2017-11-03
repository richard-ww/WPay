//
//  EnsureInsuranceVC.swift
//  66FM
//
//  Created by WeiWei on 2017/11/2.
//  Copyright © 2017年 RJS. All rights reserved.
//

import UIKit

class EnsureInsuranceVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var applicantPersonModel = PersonModel()
    var addedPersonArr = Array<PersonModel>()

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
        
        self.tableView.estimatedRowHeight = 200
        
        self.tableView.register(R.nib.insurantPersonInfoCell(), forCellReuseIdentifier: R.nib.insurantPersonInfoCell.identifier)
        self.tableView.register(R.nib.insuranceInfoCell(), forCellReuseIdentifier: R.nib.insuranceInfoCell.identifier)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.addedPersonArr.count + 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.insuranceInfoCell.identifier)
            
            return cell!
        }
        
        else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.insurantPersonInfoCell.identifier)
            
            return cell!
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.insurantPersonInfoCell.identifier)
            
            return cell!
        }
    }
}
