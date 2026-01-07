//
//  SettingsViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/12/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var cornerView: UIView!
    
    @IBOutlet weak var tableView: GeneralTableView!{
        didSet{
            tableView.register(UINib.init(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsTableViewCell")
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
extension SettingsViewController{
    func setupView(){
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        cornerView.roundCorners(corners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 30)
        
    }
    func setupData() {
            tableView.generalRowHeight = 60
            tableView.objects.append(GeneralTableViewData.init(identifier: "SettingsTableViewCell", object: Constants.MenuItem.about, rowHeight: nil))
            tableView.objects.append(GeneralTableViewData.init(identifier: "SettingsTableViewCell", object: Constants.MenuItem.terms, rowHeight: nil))
            tableView.objects.append(GeneralTableViewData.init(identifier: "SettingsTableViewCell", object: Constants.MenuItem.display, rowHeight: 300))
            tableView.objects.append(GeneralTableViewData.init(identifier: "SettingsTableViewCell", object: Constants.MenuItem.complaint, rowHeight: nil))
            tableView.objects.append(GeneralTableViewData.init(identifier: "SettingsTableViewCell", object: Constants.MenuItem.questions, rowHeight: nil))
        tableView.objects.append(GeneralTableViewData.init(identifier: "SettingsTableViewCell", object: Constants.MenuItem.language, rowHeight: nil))
        tableView.objects.append(GeneralTableViewData.init(identifier: "SettingsTableViewCell", object: Constants.MenuItem.share, rowHeight: nil))
        tableView.objects.append(GeneralTableViewData.init(identifier: "SettingsTableViewCell", object: Constants.MenuItem.call, rowHeight: nil))
        
            tableView.reloadData()

        }
}
