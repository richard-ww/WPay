//
//  InsuranceTtitleCell.swift
//  66FM
//
//  Created by WeiWei on 2017/11/2.
//  Copyright © 2017年 RJS. All rights reserved.
//

import UIKit

class InsuranceTtitleCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel! {
        
        didSet {
            
        }
    }

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
