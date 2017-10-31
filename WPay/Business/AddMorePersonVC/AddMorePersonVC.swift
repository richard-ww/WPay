//
//  AddMorePersonVC.swift
//  WPay
//
//  Created by WeiWei on 2017/10/30.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

class AddMorePersonVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var dataArr = Array<PersonModel>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataArr = [PersonModel()]
        
        self.initSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initSubviews() {
        
        self.tableView.register(R.nib.addMorePersonCell(), forCellReuseIdentifier: R.nib.addMorePersonCell.identifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.estimatedRowHeight = 200
    }
    
    func getAllPerson() -> Bool {
        
        for i in 0..<self.dataArr.count {
            
            var indexPath = IndexPath(row: i, section: 0)
            
            let cell = tableView.cellForRow(at: indexPath) as! AddMorePersonCell
            
            guard cell.checkViewData() else {
                
                return false
            }
            self.dataArr[indexPath.row] = cell.model
        }
        
        return true
    }
    
    @objc func addNextPerson() {
        
        guard self.getAllPerson() else {
            
            return
        }
        self.dataArr.append(PersonModel())
        self.tableView.reloadData()
    }
    
    @objc func jumpToNextVC() {
        
        guard self.getAllPerson() else {
            
            return
        }
        
        // 跳转至确认购买页
    }
}

extension AddMorePersonVC {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))

        let addNextBtn = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width/2, height: 40))
        addNextBtn.setTitle("+添加", for: .normal)
        addNextBtn.setTitleColor(UIColor(red: 120/255.0, green: 120/255.0, blue: 120/255.0, alpha: 1), for: .normal)
        addNextBtn.addTarget(self, action: #selector(addNextPerson), for: .touchUpInside)
        footerView.addSubview(addNextBtn)
        
        let nextStepBtn = UIButton(frame: CGRect(x: UIScreen.main.bounds.width/2, y: 0, width: UIScreen.main.bounds.width/2, height: 40))
        nextStepBtn.setTitle("下一步", for: .normal)
        nextStepBtn.setTitleColor(UIColor.black, for: .normal)
        nextStepBtn.addTarget(self, action: #selector(jumpToNextVC), for: .touchUpInside)
        footerView.addSubview(nextStepBtn)
        
        let line = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2, y: 0, width: 1, height: 40))
        line.backgroundColor = UIColor(red: 227/255.0, green: 227/255.0, blue: 227/255.0, alpha: 1)
        footerView.addSubview(line)
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.addMorePersonCell.identifier) as! AddMorePersonCell
        
        if self.dataArr.count > indexPath.row {
            
            cell.setViewWithModel(model: self.dataArr[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
