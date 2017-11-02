//
//  MaterialListCell.swift
//  WPay
//
//  Created by Weiwei on 2017/11/2.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

class MaterialListCell: UITableViewCell {

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
    
}
