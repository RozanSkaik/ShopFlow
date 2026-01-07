//
//  GeneralTableViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/7/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

protocol GeneralTableViewCellDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
    -> UISwipeActionsConfiguration?
}

class GeneralTableViewCell: UITableViewCell, GeneralTableViewCellDelegate {
    
    var cellDelegate: GeneralTableViewCellDelegate!
    
    var object: GeneralTableViewData?
    
    var tableView: GeneralTableView?
    
    var parentVC: UIViewController?
    
    var indexPath: IndexPath!
        
    var view : UIView?
            
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellDelegate = self
        
    }
    
    func configureCell() {
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
        -> UISwipeActionsConfiguration? {
            
            return UISwipeActionsConfiguration(actions: [])
    }
}



