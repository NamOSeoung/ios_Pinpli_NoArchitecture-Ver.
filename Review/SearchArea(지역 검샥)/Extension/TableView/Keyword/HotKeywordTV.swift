//
//  HotKeywordTV.swift
//  Review
//
//  Created by 남오승 on 2020/09/22.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

extension HotKeywordVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataList = self.hotKeywordReturnData?.dataList else {
            return 0
        }
        return dataList.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dataList = self.hotKeywordReturnData?.dataList else {
            return UITableViewCell.init()
        }
        
        hotKeywordCell = tableView.dequeueReusableCell(withIdentifier: "HotKeywordCell") as? HotKeywordCell
        
        
          
        if hotKeywordCell == nil {
            hotKeywordCell = Bundle.main.loadNibNamed("HotKeywordCell", owner: self, options: nil)?.first as? HotKeywordCell
        }
        
        let keywordIndex:Int = dataList[indexPath.row].index
        let keyword:String = dataList[indexPath.row].search_word
        
        hotKeywordCell?.keyword.text = "\(keywordIndex) " + keyword
        
        return hotKeywordCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        print(indexPath.row)
    }
    
}
