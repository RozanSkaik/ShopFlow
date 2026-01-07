//
//  MenuResturantViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/17/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import FloatRatingView
import Presentr

class MenuResturantViewController: ButtonBarPagerTabStripViewController {
    
    @IBOutlet weak var imgStore: roundedImage!
    @IBOutlet weak var lblStoreName: UILabel!
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var viewRating: FloatRatingView!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    var currentStore: Int?
    var categories: [ConstantsCategory] = []
    var storeObj: ViewStores?
    
    override func viewDidLoad() {
//        fetchData()
        setupView()
        super.viewDidLoad()
        localized()
        setupData()
       // fetchData()
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func menuBtn(_ sender: Any) {
        let presenter = Presentr(presentationType: .popup)
        presenter.viewControllerForContext = self
        presenter.dismissOnSwipe = true
        presenter.dismissOnSwipeDirection = .bottom
        let controller = storyboard?.instantiateViewController(withIdentifier: "PresentViewController") as! PresentViewController
        customPresentViewController(presenter, viewController: controller, animated: true, completion: nil)
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        pagerTabStripController.currentIndex = (categories.count) - 1
        var childs: [UIViewController] = []
        for i in 0..<categories.count{
            let child = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "SandwishViewController") as! SandwishViewController
            child.currentIndex = i
            child.storeId = currentStore
            child.categories = categories
            childs.append(child)
        }
        childs.reverse()
        
        return childs
    }
}

extension MenuResturantViewController{
    func setupView() {
        PagerTabStripBehaviour.progressive(skipIntermediateViewControllers: true, elasticIndicatorLimit: true)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = .clear
        settings.style.buttonBarItemFont = .systemFont(ofSize: 14)
        settings.style.selectedBarHeight = 0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = UIColor.init(named: "#E2E2E2")
        settings.style.selectedBarBackgroundColor = UIColor.init(named: "#24A29B") ?? .black
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.selectedBarBackgroundColor = UIColor.init(named: "#24A29B") ?? .black
        
        settings.style.selectedBarHeight = 5
        settings.style.buttonBarRightContentInset = 0
        settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 16)
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.init(named: "#E2E2E2")
            newCell?.label.textColor = UIColor.init(named: "#24A29B")
        }
    }
    func localized() {
        
    }
    func setupData() {
        imgStore.LoadImageFromUrl(url: storeObj?.imageProfile)
        lblStoreName.text = storeObj?.name
        lblDiscount.text = "%\(storeObj?.discountPercent ?? 0) خصم"
        lblStatus.text = storeObj?.status
        viewRating.maxRating = storeObj?.rate ?? 0
        lblDistance.text = Constants.shared.getDistance(fromLat: storeObj?.latitude ?? 0.0, fromLong: storeObj?.longitude ?? 0.0)
        lblDate.text = "\(storeObj?.timeFrom ?? "") - \(storeObj?.timeTo ?? "")"
    }
//    func fetchData() {
//        let request = CategoryRequest()
//        request.id = "\(currentStore ?? 0)"
//        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
//            self.categories = obj.categories
//        }
//    }
    
}
