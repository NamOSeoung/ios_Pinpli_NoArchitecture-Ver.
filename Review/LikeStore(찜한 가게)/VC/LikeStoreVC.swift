//
//  LikeStoreVC.swift
//  Review
//
//  Created by 남오승 on 2020/09/27.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class LikeStoreVC: UIViewController {
      
    @IBOutlet weak var likeTV: UITableView!
    
    var searchStoreCell : SearchStoreCell?
    
    var bookmarkInfoReturn : BookmarkInfoReturn?
    override func viewDidLoad() {
        super.viewDidLoad()
     
        likeTV.delegate = self
        likeTV.dataSource = self
        likeTV.backgroundColor = .white
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getBookmark(callingView: self as Any, gubun: "place")
    }
}
