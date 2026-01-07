//
//  SandwishViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/17/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class SandwishViewController: UIViewController {
    
    @IBOutlet weak var sandwichCollectionView: GeneralCollectionView!{
        didSet{
            sandwichCollectionView.register(UINib(nibName: "MenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MenuCollectionViewCell")
        }
    }
    var currentIndex: Int?
    var storeId: Int?
    var categories: [ConstantsCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width: CGFloat = (UIScreen.main.bounds.width - 40)
        let height: CGFloat = 135
        let size: CGSize = CGSize(width: width, height: height)
        self.sandwichCollectionView.cellSize(size)
    }
}
extension SandwishViewController{
    func setupView(){
        sandwichCollectionView.showEmptyDataSet = true
        sandwichCollectionView.EmptyDataTitle = "لا يوجد منتجات"
        sandwichCollectionView.EmptyDataImage = "ic_empty_product".image_
    }
    func fetchData(){
        let request = ViewStoreProductsRequest()
        request.store_id = "\(storeId ?? 0)"
        request.category_id = "\(UserProfile.shared.categories?[currentIndex ?? 0].id ?? 0)"
        self.sandwichCollectionView.withIdentifier(identifier: "MenuCollectionViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
            return obj.viewStoreProducts
        }.buildRequest()
    }
}
extension SandwishViewController: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        let activity = categories[currentIndex ?? 0]
        return IndicatorInfo(title: activity.name ?? "")
    }
    
}

