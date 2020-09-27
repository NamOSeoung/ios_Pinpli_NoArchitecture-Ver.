//
//  SearchResultVC.swift
//  Review
//
//  Created by 남오승 on 2020/09/24.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class SearchResultVC: UIViewController {

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
