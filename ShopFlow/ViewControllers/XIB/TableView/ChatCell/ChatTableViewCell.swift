//
//  ChatTableViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/15/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class ChatTableViewCell: GeneralTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let parent = self.parentVC as? ChatViewController {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "MessagingViewController")
            parent.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
