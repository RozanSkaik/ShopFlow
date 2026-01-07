//
//  CategoriesViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/10/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    
    @IBOutlet weak var allCategoriesCollectionView: GeneralCollectionView!{
        didSet{
            allCategoriesCollectionView.register(UINib.init(nibName: "allCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "allCategoriesCollectionViewCell")
        }
    }
    
    @IBOutlet weak var lastCategoriesCollectionView: GeneralCollectionView!{
        //CategoriesCollectionViewCell
        didSet{
            lastCategoriesCollectionView.register(UINib.init(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width: CGFloat = (UIScreen.main.bounds.width - 30)/3
        let height: CGFloat = width + 30
        let size: CGSize = CGSize(width: width, height: height)
        self.lastCategoriesCollectionView.cellSize(size)
        let width2: CGFloat = (UIScreen.main.bounds.width)/4
        let height2: CGFloat = width2 + 20
        let size2: CGSize = CGSize(width: width2, height: height2)
        self.allCategoriesCollectionView.cellSize(size2)
    }
    
    
}
extension CategoriesViewController{
    func setupView(){
        for _ in 0..<8{
            self.lastCategoriesCollectionView.objects.append(GeneralCollectionViewData.init(identifier: "CategoriesCollectionViewCell", object: nil)) 
        }
    }
    func fetchData(){
        let request = OtherServicesRequest()
        
        self.allCategoriesCollectionView.withIdentifier(identifier: "allCategoriesCollectionViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
            return obj.digitals
        }.buildRequest()
    }
}
