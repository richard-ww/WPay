//
//  MaterialItemCell.swift
//  WPay
//
//  Created by WeiWei on 2017/11/3.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

class MaterialItemCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var numTextField: UITextField!
    
    var num: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func subBtnClicked(_ sender: Any) {
        
        var currentNum = Int(self.numTextField.text!) ?? 0
        
        guard currentNum > 0 else {
            
            self.numTextField.text = "0"
            Toast.show(title: "最少为0哦！")
            return
        }
        
        currentNum -= 1
        self.numTextField.text = String(currentNum)
    }
    
    @IBAction func addBtnClicked(_ sender: Any) {
        
        var currentNum = Int(self.numTextField.text!) ?? 0
        
        guard currentNum < 999 else {
            
            self.numTextField.text = "999"
            Toast.show(title: "最大为999哦！")
            return
        }
        
        currentNum += 1
        self.numTextField.text = String(currentNum)
    }
}
