//
//  SearchViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/22/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var searchCollectionView: GeneralCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
    }
    
    @IBAction func btnDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnSearch(_ sender: Any) {
        fetchData()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width: CGFloat = (UIScreen.main.bounds.width - 60)
        let height: CGFloat = 135
        let size: CGSize = CGSize(width: width, height: height)
        self.searchCollectionView.cellSize(size)
    }
}
extension SearchViewController{
    func setupView(){
        self.searchCollectionView.register(UINib(nibName: "MenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MenuCollectionViewCell")
        searchCollectionView.showEmptyDataSet = true
        searchCollectionView.EmptyDataTitle = "لا يوجد نتائج"
        searchCollectionView.EmptyDataTitleFont = UIFont(name: "Cairo-Bold", size: 17)!
    }
    func fetchData(){
        self.searchCollectionView.clearData()
        let request = SearchRequest()
        request.text = txtSearch.text
        self.searchCollectionView.withIdentifier(identifier: "MenuCollectionViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
            return obj.viewStoreProducts
        }.buildRequest()
        self.searchCollectionView.reloadData()
    }
}
