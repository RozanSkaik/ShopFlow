//
//  MainViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/6/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import FSPagerView
import CoreLocation

class MainViewController: UIViewController {
    
    @IBOutlet weak var pagerView: FSPagerView!
    @IBOutlet weak var pageControl: FSPageControl!
    @IBOutlet weak var imgOffer: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblOfferPrice: UILabel!
    @IBOutlet weak var categoriesCollectionView: GeneralCollectionView!
    @IBOutlet weak var productCollectionView: GeneralCollectionView!
    @IBOutlet weak var imgNearPlace: UIImageView!
    @IBOutlet weak var lblNearName: UILabel!
    @IBOutlet weak var lblNearAddress: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackViewFreeDelivery: UIStackView!
    @IBOutlet weak var hieghtCategoryCV: NSLayoutConstraint!
    
    var imageNames: [String] = UserProfile.shared.slider ?? []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupPager()
        fetchData()
    }
    @IBAction func orderService(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "OrderServicesViewController") as! OrderServicesViewController
        vc.pagetype = .service
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func orderCar(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "OrderServicesViewController") as! OrderServicesViewController
        vc.pagetype = .car
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func digitalBtn(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "DigitalServicesViewController") as! DigitalServicesViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func offersBtn(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "OfferViewController")
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func nearPlaces(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "NearPlacesViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width: CGFloat = (UIScreen.main.bounds.width - 60)
        let height: CGFloat = 100
        let size: CGSize = CGSize(width: width, height: height)
        self.categoriesCollectionView.cellSize(size)
        
        let width2: CGFloat = (UIScreen.main.bounds.width - 40) / 3
        let height2: CGFloat = 160
        let size2: CGSize = CGSize(width: width2, height: height2)
        self.productCollectionView.cellSize(size2)
        
    }
}
extension MainViewController{
    func setupView(){
        categoriesCollectionView.register(UINib.init(nibName: "CategotiesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategotiesCollectionViewCell")
        productCollectionView.register(UINib.init(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
    }
    func setupPager(){
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        pagerView.itemSize = FSPagerView.automaticSize
        pageControl.layer.cornerRadius = 10
        pageControl.numberOfPages = self.imageNames.count
        pageControl.contentHorizontalAlignment = .center
        pagerView.delegate = self
        pagerView.dataSource = self
        pagerView.isInfinite = true
        pagerView.automaticSlidingInterval = 3.0
        pagerView.transformer = FSPagerViewTransformer(type:.overlap)
        let transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        pagerView.itemSize = self.pagerView.frame.size.applying(transform)
        pagerView.decelerationDistance = FSPagerView.automaticDistance
        pagerView.interitemSpacing = 10
        pageControl.setImage("selected".image_, for: .selected)
        pageControl.setImage("unselected".image_, for: .normal)
        pageControl.numberOfPages = self.imageNames.count
        pageControl.itemSpacing = 10
        pageControl.interitemSpacing = 20
        
    }
    func fetchData(){
        //MARK: Offer
        let offerObj = UserProfile.shared.offer
        self.imgOffer.LoadImageFromUrl(url: offerObj?.image, placeholder: "offer")
        self.lblTitle.text = offerObj?.name
        self.lblDescription.text = offerObj?.descriptionField
        self.lblOfferPrice.text = "  \(offerObj?.offerPrice ?? 0) $"
        if offerObj?.deliveryCost != 0{
            self.stackViewFreeDelivery.isHidden = true
        }else{
            self.stackViewFreeDelivery.isHidden = false
        }
        //MARK: Categories
        let homePageCategoriesArr = UserProfile.shared.homePageCategories
        if homePageCategoriesArr?.count != 0{
            for homePageCategories in homePageCategoriesArr ?? []{
                self.categoriesCollectionView.objects.append(GeneralCollectionViewData(identifier: "CategotiesCollectionViewCell", object: homePageCategories))
            }
            self.hieghtCategoryCV.constant = CGFloat(120 * (homePageCategoriesArr?.count ?? 0))
        }
        //MARK: Products
        let ShopFlowProductsArr = UserProfile.shared.ShopFlowProducts
        for ShopFlowProducts in ShopFlowProductsArr ?? []{
            self.productCollectionView.objects.append(GeneralCollectionViewData(identifier: "ProductCollectionViewCell", object: ShopFlowProducts))
        }
        //MARK: Near Store
        let nearObj = UserProfile.shared.viewStore
        self.imgNearPlace.LoadImageFromUrl(url: nearObj?.imageProfile)
        self.lblNearName.text = nearObj?.name
        self.lblNearAddress.text = nearObj?.address
        self.lblDistance.text = Constants.shared.getDistance(fromLat: nearObj?.latitude ?? 0.0, fromLong: nearObj?.longitude ?? 0.0)
    }
}
extension MainViewController: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        let activity = UserProfile.shared.activities?[0]
        return IndicatorInfo(title: activity?.name ?? "")
    }
    
}
extension MainViewController: FSPagerViewDelegate, FSPagerViewDataSource {
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.imageNames.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        let obj = self.imageNames[index]
        cell.imageView?.clipsToBounds = false
        cell.imageView?.layer.shadowRadius = 0
        cell.imageView?.layer.cornerRadius = 25
        cell.imageView?.LoadImageFromUrl(url: obj ,placeholder: "slider_img")
        cell.imageView?.contentMode = .scaleAspectFit
        return cell
    }
    
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pageControl.currentPage = pagerView.currentIndex
    }
    
}
