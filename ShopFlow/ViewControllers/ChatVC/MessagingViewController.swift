//
//  MessagingViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/15/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class MessagingViewController: UIViewController {
    
    @IBOutlet weak var messagingTableView: GeneralTableView!{
        didSet{
            messagingTableView.register(UINib(nibName: "MessageTableViewCell", bundle: nil), forCellReuseIdentifier: "MessageTableViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension MessagingViewController{
    
    func setupData(){
        for _ in 0..<3{
            self.messagingTableView.objects.append(GeneralTableViewData.init(identifier: "MessageTableViewCell", object: nil))
        }
        messagingTableView.reloadData()
        scrollToBottom()
        
    }
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.messagingTableView.objects.count-1, section: 0)
            self.messagingTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}
