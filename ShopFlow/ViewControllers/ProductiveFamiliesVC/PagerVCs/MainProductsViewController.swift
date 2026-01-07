//
//  MainProductsViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/9/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MainProductsViewController: UIViewController {
    
    @IBOutlet weak var productCollectionView: GeneralCollectionView!{
        didSet{
            productCollectionView.register(UINib.init(nibName: "MainProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainProductsCollectionViewCell")
        }
    }
    var currentIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width: CGFloat = (UIScreen.main.bounds.width - 50) / 2
        let height: CGFloat = 250
        let size: CGSize = CGSize(width: width, height: height)
        self.productCollectionView.cellSize(size)
        
    }
    
}

extension MainProductsViewController{
    
    func fetchData(){
        let request = ShopFlowStoreRequest()
        request.id = "\(currentIndex ?? 0)"
        self.productCollectionView.withIdentifier(identifier: "MainProductsCollectionViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
            return obj.viewStoreProducts
        }.buildRequest()
    }
}
extension MainProductsViewController: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        let activity = UserProfile.shared.activities?[currentIndex ?? 0]
        return IndicatorInfo(title: activity?.name ?? "")
    }
    
}
