//
//  TipsHudView.swift
//  66FM
//
//  Created by WeiWei on 2017/8/8.
//  Copyright © 2017年 RJS. All rights reserved.
//

import UIKit

class Toast: UIView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var centerYCons: NSLayoutConstraint!
    
    override func awakeFromNib() {
        
//        NSMutableParagraphStyle
//        titleLabel.head 
    }
    
    class func show(title: String?, afterDelay: Int = 3) {
        
        let tipHud = R.nib.toast.firstView(owner: nil)!
        tipHud.showWithTitle(title: title, afterDelay: afterDelay)
    }
    
    func showWithTitle(title: String?, afterDelay: Int = 1) {
        

        self.frame = CGRect(x: 0, y: 0, width: (UIApplication.shared.keyWindow?.frame.width)!, height: (UIApplication.shared.keyWindow?.frame.height)!)
        UIApplication.shared.keyWindow?.addSubview(self)
        
        self.titleLabel.text = title
        self.layoutIfNeeded()
        self.containerView.alpha = 0

        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            
            self.containerView.alpha = 1
            self.centerYCons.constant = 0
            self.layoutIfNeeded()
            
        }, completion: nil)


        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(afterDelay)) {
            
            self.hide()
        }
        
        self.isUserInteractionEnabled = false
    }
    
    func hide() {
        self.centerYCons.constant = -30
      
        UIView.animate(withDuration: 0.5, animations: {
            self.layoutIfNeeded()
            self.alpha = 0
        }) { (true) in
            
            self.removeFromSuperview()
        }
    }
}
