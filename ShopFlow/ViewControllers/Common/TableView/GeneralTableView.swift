//
//  GeneralTableView.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/7/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import SwiftyJSON
import DZNEmptyDataSet
import SwiftPullToRefresh

class GeneralTableView: UITableView {
    
    typealias emptyClouser = (() -> Void)
    
    typealias jsonClouser = ((_ obj: Response) -> [Any])?
    
    var objects: [GeneralTableViewData] = []
    
    var generalRowHeight: CGFloat?
    
    var generalHeaderHeight: CGFloat = 70
    
    var EmptyDataImage: UIImage? = UIImage()
    
    var EmptyDataTitle: String = "لا يوجد بيانات لعرضها"
    
    var EmptyDataTitleFont: UIFont = UIFont(name: "Cairo-Bold", size: 17)!
    
    var EmptyDataTitleColor: UIColor = .gray
    
    var isShowLoaderWhileRequest: Bool = true
    
    var isShowErrorMessage: Bool = false
    
    var showEmptyDataSet: Bool = true
    
    private var identifier: String = ""
    
    var request: BaseRequest = BaseRequest()
    
    var isShowPullToRefresh: Bool = true
    
    var isLoadMore: Bool = false
    
    var currentPage = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
        self.dataSource = self
        self.emptyDataSetSource = self
        self.emptyDataSetDelegate = self
    }
    
    func setupTableView(){
        self.pullToRefresh()
        self.loadMore()
    }
    
    private var didFinish: emptyClouser?
    func didFinishRequest(_ didFinishParameter: emptyClouser?) -> GeneralTableView {
        self.didFinish = didFinishParameter
        return self
    }
    
    private var parsingObject: jsonClouser?
    func parsingObjectFunc(_ jsonClouser: jsonClouser?) -> GeneralTableView {
        self.parsingObject = jsonClouser
        return self
    }
}

extension GeneralTableView {
    public func cellHeight(_ height: CGFloat?) {
        if height == nil {
            self.estimatedRowHeight = UITableView.automaticDimension
            self.rowHeight = UITableView.automaticDimension
        } else {
            self.estimatedRowHeight = CGFloat.zero
            self.generalRowHeight = height!
            self.rowHeight = height!
        }
    }
    
    func withIdentifier(identifier: String) -> GeneralTableView {
        self.identifier = identifier
        return self
    }
    
    func withRequest(request: BaseRequest) -> GeneralTableView {
        self.request = request
        return self
    }
    
    func buildRequest() -> GeneralTableView  {
        
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
            self.objects.append(GeneralTableViewData.init(identifier: self.identifier, object: item, rowHeight: nil))
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
        self.buildRequest()
        
    }
    func stopLoader(){
        self.spr_endRefreshing()
    }
    func clearData(){
        currentPage = 1
        self.objects.removeAll()
        self.reloadData()
    }
    
}

extension GeneralTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = self.objects[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: obj.identifier, for: indexPath) as! GeneralTableViewCell
        cell.object = obj
        cell.tableView = self
        cell.indexPath = indexPath
        cell.parentVC = self.parentViewController
        cell.configureCell()
        return cell
    }
    
}

extension GeneralTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! GeneralTableViewCell
        cell.cellDelegate.tableView(tableView, didSelectRowAt: indexPath)
    }
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        let cell = tableView.cellForRow(at: indexPath) as! GeneralTableViewCell
//        return cell.cellDelegate.tableView(tableView, canEditRowAt: indexPath)
//    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath) as! GeneralTableViewCell
//        cell.cellDelegate.tableView(tableView, commit: UITableViewCell.EditingStyle.delete, forRowAt: indexPath)
//    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
        -> UISwipeActionsConfiguration? {
            let cell = tableView.cellForRow(at: indexPath) as! GeneralTableViewCell
            return cell.cellDelegate.tableView(tableView, trailingSwipeActionsConfigurationForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let obj = self.objects[indexPath.row]
        obj.rowHeight = self.generalRowHeight
        return obj.rowHeight ?? UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let obj = self.objects[indexPath.row]
        obj.rowHeight = self.generalRowHeight
        return obj.rowHeight ?? UITableView.automaticDimension
    }
}

extension GeneralTableView: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return EmptyDataImage ?? UIImage()
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString.init(string: EmptyDataTitle, attributes: [NSAttributedString.Key.font : EmptyDataTitleFont, NSAttributedString.Key.foregroundColor: EmptyDataTitleColor])
    }
}

