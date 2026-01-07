//
//  ProductiveFamiliesViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/9/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import FSPagerView
import XLPagerTabStrip

class ProductiveFamiliesViewController: ButtonBarPagerTabStripViewController {
    
    @IBOutlet weak var pagerView: FSPagerView!{
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.itemSize = FSPagerView.automaticSize
            self.pagerView.layer.cornerRadius = 10
        }
    }
    var imageNames: [String] = ["games", "games2", "games"]
    
    override func viewDidLoad() {
        setupPager()
        super.viewDidLoad()
        setupView()
    }
    

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        pagerTabStripController.currentIndex = (UserProfile.shared.activities?.count ?? 0 ) - 1
        var childs: [UIViewController] = []
        for i in 0..<(UserProfile.shared.activities?.count ?? 0 ){
            let child = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "MainProductsViewController") as! MainProductsViewController
            child.currentIndex = i
            childs.append(child)
        }
        childs.reverse()
        
        return childs
        
    }

}
extension ProductiveFamiliesViewController{
    func setupView(){
        pagerView.delegate = self
        pagerView.dataSource = self
        pagerView.isInfinite = true
        pagerView.automaticSlidingInterval = 3.0
        self.pagerView.transformer = FSPagerViewTransformer(type:.linear)
        let transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        self.pagerView.itemSize = self.pagerView.frame.size.applying(transform)
        self.pagerView.decelerationDistance = FSPagerView.automaticDistance
        self.pagerView.interitemSpacing = 10
    }
    func setupPager(){
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
}
extension ProductiveFamiliesViewController: FSPagerViewDelegate, FSPagerViewDataSource {
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.imageNames.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        let obj = self.imageNames[index]
        cell.imageView?.image = UIImage(named: obj)
        cell.imageView?.clipsToBounds = false
        
        cell.imageView?.layer.shadowRadius = 0
        cell.imageView?.layer.cornerRadius = 25
        //cell.imageView?.LoadImageFromUrl(url: obj.sImage)
        cell.imageView?.contentMode = .scaleAspectFill
        return cell
    }
    
    // MARK:- FSPagerView Delegate
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
 
    
}
