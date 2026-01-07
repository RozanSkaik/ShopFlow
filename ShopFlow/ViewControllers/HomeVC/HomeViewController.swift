//
//  HomeViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/6/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class HomeViewController: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        setupView()
        super.viewDidLoad()
        localized()
        setupData()
        fetchData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        pagerTabStripController.currentIndex = (UserProfile.shared.activities?.count ?? 0 ) - 1
        var childs: [UIViewController] = []
        for i in 0..<(UserProfile.shared.activities?.count ?? 0 ) - 1{
            let child = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ResturantViewController") as! ResturantViewController
            child.currentIndex = i + 1
            childs.append(child)
        }
        childs.reverse()
        let mainChild = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "MainViewController")
        childs.append(mainChild)
        
        return childs
    }
    
}

extension HomeViewController{
    func setupView() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.buttonBarItemTitleColor = UIColor.init(named: "#E2E2E2")
        settings.style.selectedBarBackgroundColor = UIColor.init(named: "#24A29B") ?? .black
        settings.style.selectedBarHeight = 5
        settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 16)
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.init(named: "#E2E2E2")
            newCell?.label.textColor = UIColor.init(named: "#24A29B")
        }
    }
    func localized() {
        
    }
    func setupData() {
        
        
    }
    func fetchData() {
        
    }
}


