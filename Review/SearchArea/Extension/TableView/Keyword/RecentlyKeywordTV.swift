//
//  RecentlyKeywordTV.swift
//  Review
//
//  Created by 남오승 on 2020/09/22.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

extension RecentlyKeywordVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let detailFeed = detailFeed?.data else {
//            return 0
//        }
        return 10

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        tableView.backgroundColor = .clear
        
        recentlyKeywordCell = tableView.dequeueReusableCell(withIdentifier: "RecentlyKeywordCell") as? RecentlyKeywordCell
          
        if recentlyKeywordCell == nil {
            recentlyKeywordCell = Bundle.main.loadNibNamed("RecentlyKeywordCell", owner: self, options: nil)?.first as? RecentlyKeywordCell
        }
     
        return recentlyKeywordCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        print(indexPath.row)
    }
    
}
