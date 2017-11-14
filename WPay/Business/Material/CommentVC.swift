//
//  CommentVC.swift
//  WPay
//
//  Created by WeiWei on 2017/11/3.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

class CommentVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func initSubviews() {
        
        // 已登录
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenWidth/2 - 20, height: (screenWidth/2 - 20)/1.65)
        //列间距,行间距,偏移
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 15
        layout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15)
        layout.footerReferenceSize = CGSize(width: screenWidth, height: 10)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
//        self.collectionView.register(R.nib.purchaseCollectionViewCell(), forCellWithReuseIdentifier: R.nib.purchaseCollectionViewCell.identifier)
//        self.collectionView.register(R.nib.collFooterView(), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: R.nib.collFooterView.identifier)
        self.collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.nib.purchaseCollectionViewCell.identifier, for: indexPath) as! PurchaseCollectionViewCell
//
//        if self.arrOfPrice.count > indexPath.row {
//            cell.setViewWithModel(model: self.arrOfPrice[indexPath.row])
//        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionFooter {
            
//            let footView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: R.nib.collFooterView.identifier, for: indexPath)
            let footView = UICollectionReusableView()
            
            return footView
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        for (index,_) in arrOfPrice.enumerated() {
//
//            collectionView.deselectItem(at: IndexPath(row: index, section: 0), animated: true)
//            let item = collectionView.cellForItem(at: IndexPath(row: index, section: 0))
//            item?.layer.borderColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1).cgColor
//        }
        
//        let item = collectionView.cellForItem(at: indexPath) as! PurchaseCollectionViewCell
//        item.layer.borderColor = UIColor.red.cgColor
//        
//        self.moneyView.isHidden = false
//        self.moneyLabel.text = " " + item.model.price + "元"
//        self.selecteAmount = item.model.price
    }
}
