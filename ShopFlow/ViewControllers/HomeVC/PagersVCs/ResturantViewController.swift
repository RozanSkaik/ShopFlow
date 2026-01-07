//
//  ResturantViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/8/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ResturantViewController: UIViewController {
    
    @IBOutlet weak var resturantTableView: GeneralTableView!{
        didSet{
            resturantTableView.register(UINib(nibName: "ResturantTableViewCell", bundle: nil), forCellReuseIdentifier: "ResturantTableViewCell")
        }
    }
    @IBOutlet weak var imgOne: UIImageView!
    @IBOutlet weak var imgTwo: UIImageView!
    @IBOutlet weak var stackImgs: UIStackView!
    
    var currentIndex: Int?
    var currentStore: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        fetchData()
    }
}
extension ResturantViewController{
    func setupView(){
        resturantTableView.isShowPullToRefresh = true
        resturantTableView.showEmptyDataSet = true
        resturantTableView.EmptyDataTitle = "لا يوجد متاجر"
    }
    func setupData(){
       
    }
    func fetchData(){
        let request = ViewStoresRequest()
        request.id = "\(currentIndex ?? 0)"
        resturantTableView.isShowPullToRefresh = true
        self.resturantTableView.withIdentifier(identifier: "ResturantTableViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
            if obj.imagesStore.count == 1{
                self.imgOne.LoadImageFromUrl(url: obj.imagesStore[0].image)
                self.stackImgs.isHidden = false
            }else if obj.imagesStore.count == 2{
                self.imgOne.LoadImageFromUrl(url: obj.imagesStore[0].image)
                self.imgTwo.LoadImageFromUrl(url: obj.imagesStore[1].image)
                self.stackImgs.isHidden = false
            }else{
                self.stackImgs.isHidden = true
            }
            
            self.currentStore = obj.storeId
            return obj.viewStores
        }.buildRequest()
    }
}
extension ResturantViewController: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        let activity = UserProfile.shared.activities?[currentIndex ?? 0 + 1]
        return IndicatorInfo(title: activity?.name ?? "")
    }
    
}
