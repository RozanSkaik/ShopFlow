//
//  QuestionsViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/13/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet weak var cornerView: UIView!
    
    @IBOutlet weak var tableHieght: NSLayoutConstraint!
    @IBOutlet weak var qustionsTableView: GeneralTableView!{
        didSet{
            qustionsTableView.register(UINib.init(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsTableViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension QuestionsViewController{
    func setupView(){
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        cornerView.roundCorners(corners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 30)
        DispatchQueue.main.async {
            self.tableHieght.constant = CGFloat((self.qustionsTableView.objects.count) * 45)
            self.qustionsTableView.reloadData()
        }
        
    }
    func setupData() {
            qustionsTableView.generalRowHeight = 45
            qustionsTableView.objects.append(GeneralTableViewData.init(identifier: "SettingsTableViewCell", object: Constants.Questions.one, rowHeight: nil))
            qustionsTableView.objects.append(GeneralTableViewData.init(identifier: "SettingsTableViewCell", object: Constants.Questions.two, rowHeight: nil))
        qustionsTableView.objects.append(GeneralTableViewData.init(identifier: "SettingsTableViewCell", object: Constants.Questions.three, rowHeight: nil))
        qustionsTableView.objects.append(GeneralTableViewData.init(identifier: "SettingsTableViewCell", object: Constants.Questions.one, rowHeight: nil))
            qustionsTableView.objects.append(GeneralTableViewData.init(identifier: "SettingsTableViewCell", object: Constants.Questions.four, rowHeight: nil))
        qustionsTableView.objects.append(GeneralTableViewData.init(identifier: "SettingsTableViewCell", object: Constants.Questions.three, rowHeight: nil))

        
            qustionsTableView.reloadData()

        }
}
