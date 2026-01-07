//
//  PaymentOptionsViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/20/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import FSPagerView

class PaymentOptionsViewController: UIViewController {
    
    @IBOutlet weak var nav: NavigationWithTitle!
    @IBOutlet weak var pagerView: FSPagerView!{
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.itemSize = FSPagerView.automaticSize
            self.pagerControl.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var pagerControl: FSPageControl!{
        didSet {
            self.pagerControl.numberOfPages = self.imageNames.count
            self.pagerControl.contentHorizontalAlignment = .center
        }
    }
    @IBOutlet weak var paymentTableView: GeneralTableView!{
        didSet{
            paymentTableView.register(UINib(nibName: "PaymentTableViewCell", bundle: nil), forCellReuseIdentifier: "PaymentTableViewCell")
        }
    }
    
    var imageNames: [String] = ["pay_card", "pay_card", "pay_card"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
   override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       DispatchQueue.main.async {
           self.nav.title = "خيارات الدفع"
       }
   }
}
extension PaymentOptionsViewController{
    func setupView(){
        pagerView.delegate = self
        pagerView.dataSource = self
//        pagerView.isInfinite = true
//        pagerView.automaticSlidingInterval = 3.0
        self.pagerView.transformer = FSPagerViewTransformer(type:.linear)
        let transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        self.pagerView.itemSize = self.pagerView.frame.size.applying(transform)
//        self.pagerView.decelerationDistance = FSPagerView.automaticDistance
        self.pagerView.interitemSpacing = 10
        pagerControl.setImage("selected".image_, for: .selected)
        pagerControl.setImage("unselected".image_, for: .normal)
        pagerControl.itemSpacing = 10
        pagerControl.interitemSpacing = 20
        
    }
    func setupData(){
        self.paymentTableView.generalRowHeight = 60
        let request = getPaymentMethodsRequest()
        self.paymentTableView.withIdentifier(identifier: "PaymentTableViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
            return obj.payments
        }.buildRequest()
       
    }
}
extension PaymentOptionsViewController: FSPagerViewDelegate, FSPagerViewDataSource {
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.imageNames.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        let obj = self.imageNames[index]
        cell.imageView?.image = UIImage(named: obj)
        cell.imageView?.clipsToBounds = false
        
        cell.imageView?.layer.shadowRadius = 0
        cell.imageView?.layer.cornerRadius = 25
        //cell.imageView?.LoadImageFromUrl(url: obj.sImage)
        cell.imageView?.contentMode = .center
        return cell
    }
    
    // MARK:- FSPagerView Delegate
    
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
