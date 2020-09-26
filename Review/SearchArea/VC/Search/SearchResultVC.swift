//
//  SearchResultVC.swift
//  Review
//
//  Created by 남오승 on 2020/09/24.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class SearchResultVC: UIViewController {
//
//    //지역 리스트 감싸는 뷰
//    @IBOutlet weak var areaWrap: UIView!
//
//    //서울, 경기등..
//    @IBOutlet weak var areaTV: UITableView!
//
//    //성북구, 강북구 등..
//    @IBOutlet weak var areaDetailTV: UITableView!
//
//    var areaHeaderCell : AreaHeaderCell?
//
//    var areaDetailCell : AreaDetailCell?
//
//    @IBOutlet weak var currentLocationWrap: UIView!
//
//    var areaHeaderData : AreaInfoReturn?
//
//    var areaDetailData : AreaInfoReturn?
    
    @IBOutlet weak var searchKeywordGL: UILabel!
    
    var searchStoreCell : SearchStoreCell?
    
    var searchKeyword:String = ""
    
    @IBOutlet weak var searchResultTV: UITableView!
    
    var storeInfoReturn : StoreInfoReturn?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchKeywordGL.text = searchKeyword + "맛집"
        searchResultTV.delegate = self
        searchResultTV.dataSource = self
        searchResultTV.backgroundColor = .white
        
        getStoreInfo(callingView: self as Any, keyword: searchKeyword + "맛집")
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
