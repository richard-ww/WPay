//
//  InsuranceVC.swift
//  WPay
//
//  Created by Weiwei on 2017/11/1.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

class InsuranceVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var addedPersonArr = Array<PersonModel>()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initSubviews()
    }
    
    func initSubviews() {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.register(R.nib.insuranceTtitleCell(), forCellReuseIdentifier: R.nib.insuranceTtitleCell.identifier)
        self.tableView.register(R.nib.insuranceEditCell(), forCellReuseIdentifier: R.nib.insuranceEditCell.identifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ensureBtnClicked(_ sender: Any) {
        
        self.navigationController?.pushViewController(EnsureInsuranceVC(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.insuranceTtitleCell.identifier) as! InsuranceTtitleCell
            cell.titleLabel.text = "ajdhadakdhasfdsjfkdsfjsdfjkdsfsdjfbksdbhvbhdfbvfdbvjkbdfajkvjkafdjkvfakjfhjkafbslfslDFALJALKALALADSBAHHBBSHHBJABHBHbhfdsbhabhfblawebhfehjrfrhjfaelhbebhhbllbhfjerbfhrbhfbhjerhabjhbrjafhbrhjlahbjhferj"
            return cell
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.insuranceEditCell.identifier)
            
            return cell!
        }
    }
}
