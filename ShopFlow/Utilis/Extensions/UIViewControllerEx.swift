//
//  UIViewControllerEx.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/7/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlertPopUp(title: String, message: String, buttonTitle1: String = "حسناً", buttonTitle2: String = "", buttonTitle1Style: UIAlertAction.Style = .default, buttonTitle2Style: UIAlertAction.Style = .default, action1 buttonTitle1Action: @escaping (() -> Void), action2 buttonTitle2Action: @escaping (()->Void)) {
        
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let button1 = UIAlertAction.init(title: buttonTitle1, style: buttonTitle1Style) { (action) in
            print("\(buttonTitle1) Button")
            buttonTitle1Action()
        }
        let button2 = UIAlertAction.init(title: buttonTitle2, style: buttonTitle2Style) { (action) in
            print("\(buttonTitle2) Button")
            buttonTitle2Action()
        }
        if buttonTitle2 == "" {
            alert.addAction(button1)
        }else{
            alert.addAction(button1)
            alert.addAction(button2)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func showAlertError(message: String) {
        self.showAlertPopUp(title: "تنبيه", message: message, action1: {
        }) {
        }
    }
    func showAlertSuccess(message: String) {
        self.showAlertPopUp(title: "نجاح",message: message,buttonTitle1: "تم", action1: {
        }) {
        }
    }
    func showAlertSuccessWithAction(message: String, action1 buttonTitle1Action: @escaping (() -> Void)) {
        self.showAlertPopUp(title: "نجاح",message: message,buttonTitle1: "تم", action1: {
             buttonTitle1Action()
        }) {
        }
    }
    func showDeleteAlert(message: String, action1 buttonTitle1Action: @escaping (() -> Void)){
        self.showAlertPopUp(title: "تأكيد الحذف", message: message, buttonTitle1: "حذف", buttonTitle2: "الغاء", buttonTitle1Style: .destructive ,action1: {
            buttonTitle1Action()
        } ) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    func datePickerAlert(buttonTitle: UIButton,currentDateSelected: Date?,action1 buttonTitle1Action: @escaping ((_ currentDate: Date) -> Void)){
        let alert = UIAlertController(style: .actionSheet, title: "اختر التاريخ")
        var currentDate: Date?
        if self is DesignCodeViewController{
            alert.addDatePicker(mode: .date, date: currentDateSelected) { date in
                currentDate = date
            }
        }else{
            alert.addDatePicker(mode: .dateAndTime, date: currentDateSelected) { date in
                currentDate = date
            }
        }
        
        alert.addAction(title: "اختيار", style: .default){ action in
            let dateFormatter = DateFormatter()
            if self is DesignCodeViewController{
                dateFormatter.dateFormat = "yyyy-MM-dd"
            }else{
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            }
            buttonTitle.setTitle(dateFormatter.string(from: currentDate ?? Date()), for: .normal)
            buttonTitle1Action(currentDate ?? Date())

        }

        alert.addAction(title: "الغاء", style: .cancel){ action in
            self.dismiss(animated: true, completion: nil)
        }
        alert.show()
    }
    func pickerAlert(title: String,message: String,currentSelected: String? ,array: [String] = [],buttonTitle: UIButton,action1 buttonTitle1Action: @escaping (() -> Void)){
        var indexRow = 0
        let alert = UIAlertController(style: .actionSheet, title: title, message: message)
        
        var arrayPicker: [String] = []
        for item in array{
            arrayPicker.append(item)
        }
        var pickerViewValues: [[String]] = [[]]
        if  array.count > 0{
            pickerViewValues = [arrayPicker]
        }
     
        let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: array.firstIndex(of: currentSelected ?? "") ?? 0)

        alert.addPickerView(values: pickerViewValues,initialSelection: pickerViewSelectedValue) { vc, picker, index, values in
            indexRow = index.row
        }
        let button1 = UIAlertAction.init(title: "اختيار", style: .default) { (action) in
            if array.count > 0{
                buttonTitle.setTitle(arrayPicker[indexRow], for: .normal)
            }
            if let vc = self as? OrderServicesViewController{
                vc.index = indexRow
            }
            if let vc = self as? DesignCodeViewController{
                vc.index = indexRow
            }
            buttonTitle1Action()
        }
        
        alert.addAction(button1)
        alert.addAction(title: "الغاء", style: .cancel)
        alert.show()
    }
    
}
