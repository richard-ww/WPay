//
//  MaterialOrderCell.swift
//  WPay
//
//  Created by WeiWei on 2017/11/3.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

class MaterialOrderCell: UITableViewCell {
    
    var btnClickedClosure: ((_ order: String)->Void)?
    
    var order = String()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func ensureBtnClicked(_ sender: Any) {
        
        self.btnClickedClosure?(order)
    }
}
