//
//  OrderPathViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/3/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import Presentr

class OrderPathViewController: UIViewController {
    
    @IBOutlet weak var imgStore: UIImageView!
    @IBOutlet weak var lblStoreName: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblPaymentMethod: UILabel!
    @IBOutlet weak var topCorners: GradientView!
    @IBOutlet weak var bottomCorners: UIView!
    @IBOutlet weak var ordrePathCollection: GeneralCollectionView!
    @IBOutlet weak var orderProductTableView: GeneralTableView!
    @IBOutlet weak var lblOrderNo: UILabel!
    @IBOutlet weak var hieghtOrderProductTV: NSLayoutConstraint!
    @IBOutlet weak var lblSubTotal: UILabel!
    @IBOutlet weak var lblDeliveryCost: UILabel!
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    var orderId: Int?
    var status: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width: CGFloat = (UIScreen.main.bounds.width - 160)/2
        let height: CGFloat = 100
        let size: CGSize = CGSize(width: width, height: height)
        self.ordrePathCollection.cellSize(size)
        
    }
    
    @IBAction func mapBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OrderMapViewController") as! OrderMapViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func rateBtn(_ sender: Any) {
        let presenter = Presentr(presentationType: .popup)
        presenter.viewControllerForContext = self
        presenter.dismissOnSwipe = true
        presenter.dismissOnSwipeDirection = .bottom
        let controller = storyboard?.instantiateViewController(withIdentifier: "OrderRateViewController") as! OrderRateViewController
        customPresentViewController(presenter, viewController: controller, animated: true, completion: nil)
    }
    
}
extension OrderPathViewController{
    func setupView(){
        topCorners.roundCorners(corners: [.layerMaxXMinYCorner, .layerMinXMinYCorner], radius: 15)
        bottomCorners.roundCorners(corners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 15)
        ordrePathCollection.register(UINib.init(nibName: "OrderPathCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OrderPathCollectionViewCell")
        
        orderProductTableView.register(UINib(nibName: "OrderProductTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderProductTableViewCell")
    }
    
    func setupData() {
        let request = ClientOrderDetailsRequest()
        request.id = orderId
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
            self.status = obj.clientOrderDetails?.status
            self.imgStore.LoadImageFromUrl(url: obj.clientOrderDetails?.store?.imageProfile)
            self.lblStoreName.text = obj.clientOrderDetails?.store?.name
            self.lblLocation.text = obj.clientOrderDetails?.userAddress?.address ?? "غير معروف"
            self.lblPaymentMethod.text = obj.clientOrderDetails?.paymentMethod
            self.lblOrderNo.text = "#\(obj.clientOrderDetails?.id ?? 0)"
            for product in obj.clientOrderDetails?.orderProducts ?? []{
                 self.orderProductTableView.objects.append(GeneralTableViewData(identifier: "OrderProductTableViewCell", object: product))
            }
            if obj.clientOrderDetails?.orderProducts?.count > 0{
                self.hieghtOrderProductTV.constant = CGFloat(35 * (obj.clientOrderDetails?.orderProducts?.count ?? 0))
            }
            self.orderProductTableView.reloadData()
            self.lblSubTotal.text = "\(obj.clientOrderDetails?.subTotal ?? 0 ) ريال"
            self.lblDeliveryCost.text = "\(obj.clientOrderDetails?.deliveryCost ?? 0 ) ريال"
            self.lblDiscount.text = "\(obj.clientOrderDetails?.couponPercent ?? 0 ) ريال"
            self.lblTotal.text = "\(obj.clientOrderDetails?.finalTotal ?? 0.0 ) ريال"
            self.ordrePathCollection.objects.append(GeneralCollectionViewData.init(identifier: "OrderPathCollectionViewCell", object: Constants.OrderStatus.orderToDriver))
            
            self.ordrePathCollection.objects.append(GeneralCollectionViewData.init(identifier: "OrderPathCollectionViewCell", object: Constants.OrderStatus.storeAccept))
            
            self.ordrePathCollection.objects.append(GeneralCollectionViewData.init(identifier: "OrderPathCollectionViewCell", object: Constants.OrderStatus.new))
            self.ordrePathCollection.reloadData()
            
        }
        
        
    }
}
