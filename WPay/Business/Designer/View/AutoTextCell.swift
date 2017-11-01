//
//  AutoTextCell.swift
//  WPay
//
//  Created by WeiWei on 2017/11/1.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

class AutoTextCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setViewWithTitle(title: String) {
        
        self.titleLabel.text = title
        self.layoutIfNeeded()
    }
}
