//
//  DigitalServicesViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/10/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class DigitalServicesViewController: UIViewController {
        
    @IBOutlet weak var nav: NavigationWithTitle!
    @IBOutlet weak var digitalCollectionView: GeneralCollectionView!
    @IBOutlet weak var hieghtCollectonView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        
    }
   override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       DispatchQueue.main.async {
           self.nav.title = "خدمات رقمية"
       }
   }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width2: CGFloat = (UIScreen.main.bounds.width)/4
        let height2: CGFloat = width2 + 20
        let size2: CGSize = CGSize(width: width2, height: height2)
        self.digitalCollectionView.cellSize(size2)
    }
    
    
}
extension DigitalServicesViewController{
    func setupView(){
        digitalCollectionView.register(UINib.init(nibName: "allCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "allCategoriesCollectionViewCell")
    }
    func setupData(){
        let request = DigitalRequest()
        
        self.digitalCollectionView.withIdentifier(identifier: "allCategoriesCollectionViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
            if obj.digitals.count != 0{
                self.hieghtCollectonView.constant = CGFloat(80
                    * obj.digitals.count)
            }
            return obj.digitals
        }.buildRequest()
    }
}
