//
//  AutoImageCell.swift
//  66FM
//
//  Created by WeiWei on 2017/11/1.
//  Copyright © 2017年 RJS. All rights reserved.
//

import UIKit

class AutoImageCell: UITableViewCell {

    @IBOutlet weak var imgView: AspectFitImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none

        self.imgView.imageWidth = Float(UIScreen.main.bounds.width - 20)
        self.imgView.image = R.image.img165719ab05c30d4Jpg()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
