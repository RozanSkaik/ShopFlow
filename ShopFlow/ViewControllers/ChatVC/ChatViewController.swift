//
//  ChatViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/15/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet weak var chatTableView: GeneralTableView!{
        didSet{
            chatTableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        
    }
}
extension ChatViewController{
    
    func setupData(){
        self.chatTableView.generalRowHeight = 80
        for _ in 0..<6{
            self.chatTableView.objects.append(GeneralTableViewData.init(identifier: "ChatTableViewCell", object: nil))
        }
        
    }
}
