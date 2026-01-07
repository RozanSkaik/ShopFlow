//
//  MyOrdersViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/9/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class MyOrdersViewController: UIViewController {
    
    @IBOutlet weak var ordersCollectionView: GeneralCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width: CGFloat = (UIScreen.main.bounds.width - 40)
        let height: CGFloat = 184
        let size: CGSize = CGSize(width: width, height: height)
        self.ordersCollectionView.cellSize(size)
    }
 

}
extension MyOrdersViewController{
    func setupView(){
        ordersCollectionView.register(UINib.init(nibName: "MyOrdersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyOrdersCollectionViewCell")
    }
    func fetchData(){
        let request = MyOrdersRequest()
        self.ordersCollectionView.withIdentifier(identifier: "MyOrdersCollectionViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
            return obj.myOrders
        }.buildRequest()
    }
}
