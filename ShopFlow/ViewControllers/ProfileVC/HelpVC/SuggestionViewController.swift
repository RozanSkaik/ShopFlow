//
//  SuggestionViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/15/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class SuggestionViewController: UIViewController {
    
    @IBOutlet weak var cornerView: UIView!
    
    @IBOutlet weak var isShowStack: UIStackView!
    
    @IBOutlet weak var isShowStack2: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func showOrHiddenBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if(sender.isSelected == true){
            isShowStack.isHidden = true
            sender.setImage("ic-plus".image_, for: .normal)
        }else{
            isShowStack.isHidden = false
            sender.setImage("ic_minus".image_, for: .normal)
        }
        
    }
    
    @IBAction func showOrHiddenBtn2(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if(sender.isSelected == true){
            isShowStack2.isHidden = false
            sender.setImage("ic_minus".image_, for: .normal)
        }else{
            isShowStack2.isHidden = true
            sender.setImage("ic-plus".image_, for: .normal)
            
        }
    }
    
}
extension SuggestionViewController{
    func setupView(){
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        cornerView.roundCorners(corners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 30)
        
    }
}
