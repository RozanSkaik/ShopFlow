//
//  ProductDetialsViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/16/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import FSPagerView
import FloatRatingView
class ProductDetialsViewController: UIViewController {

    @IBOutlet weak var pagerView: FSPagerView!{
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.itemSize = FSPagerView.automaticSize
            self.pagerView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblOfferPrice: UILabel!
    @IBOutlet weak var pagerControl: FSPageControl!{
        didSet {
            self.pagerControl.numberOfPages = self.imageNames.count
            self.pagerControl.contentHorizontalAlignment = .center
        }
    }
    @IBOutlet weak var colorCollectionView: GeneralCollectionView!{
        didSet{
            colorCollectionView.register(UINib.init(nibName: "ColorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ColorCollectionViewCell")
        }
    }
    @IBOutlet weak var sizeCollectionView: GeneralCollectionView!{
        didSet{
            sizeCollectionView.register(UINib.init(nibName: "ColorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ColorCollectionViewCell")
        }
    }
    @IBOutlet weak var moreCollectionView: GeneralCollectionView!{
        didSet{
            moreCollectionView.register(UINib.init(nibName: "MainProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainProductsCollectionViewCell")
        }
    }
    @IBOutlet weak var lblNoOfBuy: UILabel!
    @IBOutlet weak var lblProductDescription: UILabel!
    @IBOutlet weak var viewRating: FloatRatingView!
    @IBOutlet weak var lblStoreName: UILabel!
    @IBOutlet weak var imgStore: roundedImage!
    @IBOutlet weak var lblStoreDescription: UILabel!
    @IBOutlet weak var hieghtCV: NSLayoutConstraint!
    @IBOutlet weak var stackMoreCV: UIStackView!
    @IBOutlet weak var quantityNo: UILabel!
    @IBOutlet weak var stackColor: UIStackView!
    @IBOutlet weak var stackSize: UIStackView!
    @IBOutlet weak var viewSeperator: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    var imageNames: [String] = []
    var ShopFlow_product: Int?
    var product_id: Int?
    var colorId: Int?
    var sizeId: Int?
    var productObj: ShopFlowProducts?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
    }
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func addToCartBtn(_ sender: Any) {
        let request = AddToCartRequest()
        request.product_id = "\(product_id ?? 0)"
        request.quantity = quantityNo.text
        request.color_id = "\(colorId ?? 0)"
        request.size_id = "\(sizeId ?? 0)"

        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
                self.showAlertSuccess(message: obj.message ?? "")
            }
        }
    
    @IBAction func decreaseBtn(_ sender: Any) {
        let request = ChangeQuantityRequest()
        request.product_id = "\(product_id ?? 0)"
        request.type = "decrease"
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request,showLoader: false) { (obj) in
            self.quantityNo.text = "\(obj.quantity ?? 0)"
//            if self.productObj?.offerPrice == nil || self.productObj?.offerPrice == 0{
//                self.lblPrice.text = "السعر: \((obj.quantity ?? 0) * (self.productObj?.price ?? 0)) ريال"
//            }else{
//                self.lblOfferPrice.text = "سعر العرض: \((obj.quantity ?? 0) * (self.productObj?.offerPrice ?? 0)) ريال"
//            }
            //            self.lblPrice.text = "\((obj.quantity ?? 0) * (obj.price ?? 0)) ريال"
        }
    }
    @IBAction func increaseBtn(_ sender: Any) {
        let request = ChangeQuantityRequest()
        request.product_id = "\(product_id ?? 0)"
        request.type = "increase"
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request,showLoader: false) { (obj) in
            self.quantityNo.text = "\(obj.quantity ?? 0)"
//            if self.productObj?.offerPrice == nil || self.productObj?.offerPrice == 0{
//                self.lblPrice.text = "السعر: \((obj.quantity ?? 0) * (self.productObj?.price ?? 0)) ريال"
//            }else{
//                self.lblOfferPrice.text = "سعر العرض: \((obj.quantity ?? 0) * (self.productObj?.offerPrice ?? 0)) ريال"
//            }
//            self.lblPrice.text = "\((obj.quantity ?? 0) * (obj.price ?? 0)) ريال"
        }
    }
    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
         let width: CGFloat = (UIScreen.main.bounds.width - 70) / 2
         let height: CGFloat = 250
         let size: CGSize = CGSize(width: width, height: height)
         self.moreCollectionView.cellSize(size)
         
     }
    
}
extension ProductDetialsViewController{
    func setupView(){
        colorCollectionView.showEmptyDataSet = true
        sizeCollectionView.showEmptyDataSet = true
        colorCollectionView.EmptyDataTitle = "لا يوجد ألوان"
        sizeCollectionView.EmptyDataTitle = "لا يوجد مقاسات"
    }
    func setupPager(){
        pagerView.delegate = self
        pagerView.dataSource = self
        pagerView.isInfinite = true
        pagerView.automaticSlidingInterval = 3.0
        pagerView.transformer = FSPagerViewTransformer(type:.overlap)
        let transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        pagerView.itemSize = self.pagerView.frame.size.applying(transform)
        pagerView.decelerationDistance = FSPagerView.automaticDistance
        pagerView.interitemSpacing = 10
        pagerControl.setImage("selected".image_, for: .selected)
        pagerControl.setImage("unselected".image_, for: .normal)
        pagerControl.itemSpacing = 10
        pagerControl.interitemSpacing = 20
    }

    func fetchData(){
        let request = ProductDetailsRequest()
        request.productId = self.product_id
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
            if obj.viewStoreProducts.count > 0{
                let product = obj.viewStoreProducts[0]
                self.productObj = product
                for img in product.otherImages ?? []{
                    self.imageNames.append(img.image ?? "")
                }
                self.lblDetails.text = product.descriptionField
                self.lblPrice.text = "السعر: \(product.price ?? 0) ريال"
                if product.offerPrice == nil || product.offerPrice == 0{
                    self.lblOfferPrice.isHidden = true
                }else{
                    self.lblOfferPrice.text = "سعر العرض: \(product.offerPrice ?? 0) ريال"
                }
                self.quantityNo.text = "\(obj.quantity ?? 1)"
                self.lblNoOfBuy.text = "\(product.purchaseCounts ?? 0)"
                self.lblProductDescription.text = product.descriptionField
                self.imgStore.LoadImageFromUrl(url: product.store?.imageProfile)
                self.lblStoreName.text = product.store?.name
                self.lblStoreDescription.text = product.store?.descriptionField
                self.viewRating.maxRating = product.store?.rate ?? 0
                self.ShopFlow_product = product.ShopFlowProduct
                if self.ShopFlow_product == 1 {
                    self.moreCollectionView.withIdentifier(identifier: "MainProductsCollectionViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
                        if obj.randomProducts.count != 0{
                            self.hieghtCV.constant = CGFloat(300 * (obj.randomProducts.count / 2))
                        }
                    return obj.randomProducts
                    }.buildRequest()
                }else{
                    self.stackMoreCV.isHidden = true
                }
                if obj.colors.count == 0 || obj.sizes.count == 0 {
                    self.stackColor.isHidden = true
                    self.stackSize.isHidden = true
                    self.viewSeperator.isHidden = true
                }else{
                    self.stackColor.isHidden = false
                    self.stackSize.isHidden = false
                }
                self.setupPager()
            }
        }
        self.colorCollectionView.withIdentifier(identifier: "ColorCollectionViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
            return obj.colors
        }.buildRequest()
        self.sizeCollectionView.withIdentifier(identifier: "ColorCollectionViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
            return obj.sizes
        }.buildRequest()
    }
}
extension ProductDetialsViewController: FSPagerViewDelegate, FSPagerViewDataSource {
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
        self.pagerControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pagerControl.currentPage = pagerView.currentIndex
    }
    
}

