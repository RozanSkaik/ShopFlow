//
//  GeneralCollectionView.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/7/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import DZNEmptyDataSet
import SwiftyJSON
import SwiftPullToRefresh

class CustomCellSizeCollectionView: GeneralCollectionView, UICollectionViewDelegateFlowLayout {
    
    var flowLayoutDelegate: UICollectionViewDelegateFlowLayout?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        (self.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (flowLayoutDelegate?.responds(to: #selector(UICollectionViewDelegateFlowLayout.collectionView(_:layout:sizeForItemAt:))) ?? false) {
            return flowLayoutDelegate!.collectionView!(collectionView, layout: collectionViewLayout, sizeForItemAt: indexPath)
        }
        let obj = objects[indexPath.row]
        return obj.cellSize ?? UICollectionViewFlowLayout.automaticSize
    }
}

class GeneralCollectionView: UICollectionView {
    
    typealias emptyClouser = (() -> Void)
    
    typealias jsonClouser = ((_ obj: Response) -> [Any])?
    
    var objects: [GeneralCollectionViewData] = []
    
    var object: GeneralCollectionViewData?
    
    var EmptyDataImage: UIImage? = UIImage()
    
    var EmptyDataTitle: String = "لا يوجد بيانات لعرضها"
    
    var isShowLoaderWhileRequest: Bool = true
    
    var isShowErrorMessage: Bool = false
    
    var showEmptyDataSet: Bool = true
    
    var EmptyDataTitleFont: UIFont = UIFont(name: "Cairo-Bold", size: 17)!
    
    var EmptyDataTitleColor: UIColor = .gray
    
    private var identifier: String = ""
    
    private var request: BaseRequest = BaseRequest()
    
    var isShowPullToRefresh: Bool = true
    
    var isLoadMore: Bool = false
    
    var currentPage = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
        self.dataSource = self
        if self.collectionViewLayout is UICollectionViewFlowLayout{
            (self.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
    
    func setupCollectionView(){
        self.pullToRefresh()
        self.loadMore()
    }
    
    private var didFinish: emptyClouser?
    func didFinishRequest(_ didFinishParameter: emptyClouser?) -> GeneralCollectionView {
        self.didFinish = didFinishParameter
        return self
    }
    private var parsingObject: jsonClouser?
    func parsingObjectFunc(_ jsonClouser: jsonClouser?) -> GeneralCollectionView {
        self.parsingObject = jsonClouser
        return self
    }
}

extension GeneralCollectionView {
    public func cellSize(_ size: CGSize?) {
        if size == nil {
            (self.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = CGSize(width: 1, height: 1)
        } else {
            (self.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = CGSize.zero
            (self.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = size!
        }
        self.collectionViewLayout.invalidateLayout()
    }
    
    func withIdentifier(identifier: String) -> GeneralCollectionView {
        self.identifier = identifier
        return self
    }
    
    func withRequest(request: BaseRequest) -> GeneralCollectionView {
        self.request = request
        return self
    }
    
    func buildRequest() -> GeneralCollectionView  {

        RequestBuilder.request(request: self.request, showLoader: isShowLoaderWhileRequest, success: { (obj) in
            self.showEmptyDataSet = true
            self.stopLoader()
            self.buildData(objs: self.parsingObject!!(obj))
        }) { (error) in
            self.showEmptyDataSet = true
            self.stopLoader()
        }
        
        return self
    }
    
    func buildData(objs: [Any]?) {
        for item in objs ?? [] {
            self.objects.append(GeneralCollectionViewData.init(identifier: self.identifier, object: item))
        }
        self.reloadData()
    }
    
    func pullToRefresh(){
        if isShowPullToRefresh {
            self.clearData()
            self.reloadData()
            self.spr_setIndicatorHeader {
                self.getDataPullToRefresh()
            }
        }
    }
    
    @objc func getDataPullToRefresh() {
        self.clearData()
        self.buildRequest()
    }
    
    func loadMore(){
        if isLoadMore{
            self.reloadData()
            self.spr_setIndicatorFooter {
                self.getDataLoadMore()
            }
        }
    }
    
    @objc func getDataLoadMore() {
        self.reloadData()
        currentPage += 1
        //self.request.parameters["i_page_number"] = currentPage
        self.buildRequest()
        
    }
    func stopLoader(){
        self.spr_endRefreshing()
    }
    func clearData(){
        self.objects.removeAll()
        self.reloadData()
    }
}

extension GeneralCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.objects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let obj = self.objects[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: obj.identifier, for: indexPath) as! GeneralCollectionViewCell
        cell.object = obj
        cell.indexPath = indexPath
        cell.collectionView = self
        cell.parentVC = self.parentViewController
        cell.configureCell()
        return cell
    }
}

extension GeneralCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! GeneralCollectionViewCell
        cell.cellDelegate.collectionView(collectionView, didSelectItemAt: indexPath)
    }
}



extension GeneralCollectionView: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return EmptyDataImage ?? UIImage()
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString.init(string: EmptyDataTitle, attributes: [NSAttributedString.Key.font : EmptyDataTitleFont, NSAttributedString.Key.foregroundColor: EmptyDataTitleColor])
    }
}




