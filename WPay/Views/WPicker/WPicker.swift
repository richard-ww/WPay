//
//  WPicker.swift
//  WPay
//
//  Created by WeiWei on 2017/11/8.
//  Copyright © 2017年 --. All rights reserved.
//

import UIKit

enum PickerType {
    case normal
    case datePicker
}

enum DateType {
    case dateType
    case timeTpye
}

class PickerModel: NSObject {
    
    var name = String()
    var id   = String()
}

class WPicker: UIView {
    
    
    var dataArr = [PickerModel]()
    var picker: WPicker!
    
    var pickerType = PickerType.normal
    var dateType = DateType.dateType
    
    
    var selectedModel = PickerModel()
    
    fileprivate var normalPicker = UIPickerView()
    fileprivate var datePicker = UIDatePicker()
    
    var ensureBtnClickedClosure: ((_ model: PickerModel) -> Void)?
    

    class func creatPicker(type: PickerType, dataArr: [PickerModel] = [PickerModel](), dateType: DateType = DateType.dateType) -> WPicker {
        
        let wPicker = WPicker()
        wPicker.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        wPicker.frame = (UIApplication.shared.keyWindow?.frame)!
        UIApplication.shared.keyWindow?.addSubview(wPicker)
        
        wPicker.pickerType = type
        wPicker.dataArr = dataArr
        
        wPicker.initSubviews()
        
        switch type {
        case .normal:
            wPicker.createNormalPicker(dataArr: dataArr)
        case .datePicker:
            wPicker.createDatePicker()
        }
        
        return wPicker
    }
    
    func initSubviews() {
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: screenHeight-215-40, width: screenWidth, height: 40))
        self.addSubview(toolBar)
        
        let leftItem = UIBarButtonItem(title: "  取消", style: .plain, target: self, action: #selector(hide))
        let rightItem = UIBarButtonItem(title: "确定  ", style: .plain, target: self, action: #selector(ensure))
        let flexItem1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        toolBar.items = [leftItem,flexItem1,rightItem]
    }
    
    @objc func hide() {
        
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0
        }) { (complete) in
            self.removeFromSuperview()
        }
    }
    
    @objc func ensure() {
        
        self.hide()
        
        if pickerType == .datePicker {
            
            var dateStr = String()
            let dateFormatter = DateFormatter()
            
            if dateType == .dateType {
                dateFormatter.dateFormat = "YYYY-MM-DD"
            }
            else{
                dateFormatter.dateFormat = "YYYY-MM-DD HH:mm"
            }
            
            dateStr = dateFormatter.string(from: self.datePicker.date)
            
            self.selectedModel.name = dateStr
            self.selectedModel.id = "0"
        }
        
        self.ensureBtnClickedClosure?(self.selectedModel)
    }
}

extension WPicker: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK:- normalPicker
    func createNormalPicker(dataArr: [PickerModel]) {
        
        normalPicker.frame = CGRect(x: 0, y: screenHeight - 215, width: screenWidth, height: 215)
        normalPicker.backgroundColor = UIColor.white
        
        normalPicker.dataSource = self
        normalPicker.delegate = self
        
        self.addSubview(normalPicker)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return self.dataArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return self.dataArr[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.selectedModel = self.dataArr[row]
    }
}

extension WPicker {
    
    // MARK:- datePicker
    func createDatePicker() {
        
        datePicker.frame = CGRect(x: 0, y: screenHeight - 215, width: screenWidth, height: 215)
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = UIColor.white
        
        self.addSubview(normalPicker)
    }
}
