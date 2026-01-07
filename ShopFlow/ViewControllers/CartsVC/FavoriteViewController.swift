//
//  FavoriteViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/26/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var favoriteTableView: GeneralTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
    }
   
}
extension FavoriteViewController{
    func setupView(){
        favoriteTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
        self.favoriteTableView.generalRowHeight  = 125
        favoriteTableView.showEmptyDataSet = true
        favoriteTableView.EmptyDataTitle = "لا يوجد منتجات مفضلة"
        favoriteTableView.EmptyDataImage = "ic_fav".image_
        favoriteTableView.EmptyDataTitleFont = UIFont(name: "Cairo-Bold", size: 15)!
    }
    func fetchData(){
        
        let request = FavoriteCartRequest()
        self.favoriteTableView.withIdentifier(identifier: "CartTableViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
            
            return obj.viewStoreProducts
        }.buildRequest()
       
    }
}
