//
//  HUDView.swift
//  66FM
//
//  Created by PandaApe on 21/08/2017.
//  Copyright © 2017 RJS. All rights reserved.
//

import UIKit

open class HUDView: UIView {

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var point1: UILabel!
    @IBOutlet weak var point2: UILabel!
    @IBOutlet weak var point3: UILabel!
    
    static var sharedHudView :HUDView!
    
    @discardableResult
    open class func showHud(title: String = "加载中") -> HUDView {

        let window  = UIApplication.shared.keyWindow!

        if sharedHudView == nil {
          
            sharedHudView = R.nib.hUDView.firstView(owner: nil)!
            
            sharedHudView.frame  = window.bounds
        }
        
        window.addSubview(sharedHudView)

        sharedHudView.titleLabel.text = title
        sharedHudView.animting()
        
        return sharedHudView
    }
    
   fileprivate func animting() {
    
    let point1Anim         = CAKeyframeAnimation(keyPath: "opacity")
    point1Anim.keyTimes    = [0, 0.2, 0.21, 0.6]
    point1Anim.values      = [1, 1, 0.5, 0.5]
    point1Anim.duration    = 0.6
    point1Anim.beginTime   = CACurrentMediaTime()
    point1Anim.fillMode    = kCAFillModeForwards
    point1Anim.isRemovedOnCompletion = false
    point1Anim.repeatCount = .infinity

    let point2Anim         = CAKeyframeAnimation(keyPath: "opacity")
    point2Anim.keyTimes    = [0,    0.2,    0.21,   0.4,    0.41,   0.6]
    point2Anim.values      = [0.5,  0.5,    1,      1,      0.5,    0.5]
    point2Anim.duration    = 0.6
    point2Anim.beginTime   = CACurrentMediaTime()
    point2Anim.fillMode    = kCAFillModeForwards
    point2Anim.isRemovedOnCompletion = false
    point2Anim.repeatCount = .infinity

    let point3Anim         = CAKeyframeAnimation(keyPath: "opacity")
    point3Anim.keyTimes    = [0,    0.2,    0.21,   0.4,    0.59,   0.6]
    point3Anim.values      = [0.5,  0.5,    0.5,    1,      1,      0.5]
    point3Anim.duration    = 0.6
    point3Anim.beginTime   = CACurrentMediaTime()
    point3Anim.fillMode    = kCAFillModeForwards
    point3Anim.isRemovedOnCompletion = false
    point3Anim.repeatCount = .infinity
    
    point1.layer.add(point1Anim, forKey: "point1Anim1") 

    point2.layer.add(point2Anim, forKey: "point2Anim")  
    
    point3.layer.add(point3Anim, forKey: "point3Anim")
   
    }
    
    
    class func hideHud() {
        
        guard let _ = sharedHudView else { return }
        
        UIView.animate(withDuration: 0.3, animations: { 
            
            sharedHudView.alpha = 0
            
        }) { (completed) in
            
            sharedHudView.removeFromSuperview()
            sharedHudView.alpha = 1
        }
        
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
   
    }
    
    
    

}
