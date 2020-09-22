//
//  HotKeywordVC.swift
//  Review
//
//  Created by 남오승 on 2020/09/22.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class HotKeywordVC: UIViewController {

    //hotKeywordTableView
    @IBOutlet weak var hotKeywordTV: UITableView!
    var hotKeywordCell : HotKeywordCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hotKeywordTV.delegate = self
        hotKeywordTV.dataSource = self
        hotKeywordTV.backgroundColor = .white
    }
}
