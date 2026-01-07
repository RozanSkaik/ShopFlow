//
//  NearPlacesViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/14/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class NearPlacesViewController: UIViewController {

    @IBOutlet weak var nearPlacesCollectionView: GeneralCollectionView!{
        didSet{
            nearPlacesCollectionView.register(UINib.init(nibName: "NearPlacesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NearPlacesCollectionViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width: CGFloat = (UIScreen.main.bounds.width - 40)
        let height: CGFloat = 100
        let size: CGSize = CGSize(width: width, height: height)
        self.nearPlacesCollectionView.cellSize(size)
    }
}
extension NearPlacesViewController{
    func fetchData(){
        let nearStoreRequest = NearbyStoresRequest()
        nearStoreRequest.latitude = UserDefaults.standard.double(forKey: "latitude")
        nearStoreRequest.longitude = UserDefaults.standard.double(forKey: "longitude")
        self.nearPlacesCollectionView.withIdentifier(identifier: "NearPlacesCollectionViewCell").withRequest(request: nearStoreRequest).parsingObjectFunc { (obj) -> [Any] in
            return obj.viewStores
        }.buildRequest()
    }
}
