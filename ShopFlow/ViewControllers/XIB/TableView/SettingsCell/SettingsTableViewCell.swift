//
//  SettingsTableViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/12/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class SettingsTableViewCell: GeneralTableViewCell {
    
    @IBOutlet weak var settingsImg: UIImageView!
    
    @IBOutlet weak var settingsName: UILabel!
    
    @IBOutlet weak var arrow: UIImageView!
    
    @IBOutlet weak var language: UILabel!
    
    override func configureCell() {
        if let obj = self.object?.object as? Constants.MenuItem {
            self.settingsImg.image = obj.image
            self.settingsName.text = obj.name
            arrow.isHidden = obj.isHiddenArrow
            language.isHidden = obj.isShowLanguage
        }
        if let obj = self.object?.object as? Constants.Questions {
            self.settingsImg.isHidden = true
            self.settingsName.text = obj.name
            self.settingsName.font = UIFont(name: "Cairo-SemiBold", size: 18)
            arrow.isHidden = false
            language.isHidden = true
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let parent = self.parentVC as? SettingsViewController {
            if let obj = self.object?.object as? Constants.MenuItem {
                switch obj {
                case .about:
                    break
                case .terms:
                    break
                case .display:
                    break
                case .complaint:
                    break
                case .questions:
                    let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "QuestionsViewController")
                    parent.navigationController?.pushViewController(vc, animated: true)
                    break
                case .language:
                    break
                case .share:
                    break
                case .call:
                    break
                }
            }
        }else if let parent = self.parentVC as? QuestionsViewController{
            if let obj = self.object?.object as? Constants.Questions {
                switch obj{
                case .one:
                    break
                case .two:
                    break
                case .three:
                    break
                case .four:
                    let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "SuggestionViewController")
                    parent.navigationController?.pushViewController(vc, animated: true)
                    break
                    
                }
            }
        }
        
    }
    
}
