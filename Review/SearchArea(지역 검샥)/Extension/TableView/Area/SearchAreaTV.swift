//
//  AreaHeaderTV.swift
//  Review
//
//  Created by 남오승 on 2020/09/23.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

extension SearchAreaVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.areaTV {
            guard let dataList = self.areaHeaderData?.dataList else {
                return 0
            }
            return dataList.count
        }else if tableView == self.areaDetailTV{
            guard let dataList = self.areaDetailData?.dataList else {
                return 0
            }
            return dataList.count
        }else {
            return self.searchKeywordList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.areaTV {
            guard let dataList = self.areaHeaderData?.dataList else {
                return UITableViewCell.init()
            }
            
            areaHeaderCell = tableView.dequeueReusableCell(withIdentifier: "AreaHeaderCell") as? AreaHeaderCell
              
            if areaHeaderCell == nil {
                areaHeaderCell = Bundle.main.loadNibNamed("AreaHeaderCell", owner: self, options: nil)?.first as? AreaHeaderCell
            }
         
            if dataList[indexPath.row].selectedFlag! {
                areaHeaderCell?.areaRightBorder.isHidden = false
                areaHeaderCell?.areaHeader.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
            }else {
                areaHeaderCell?.areaRightBorder.isHidden = true
                areaHeaderCell?.areaHeader.textColor = UIColor(red: 189/255, green: 189/255, blue: 189/255, alpha: 1)
            }

            areaHeaderCell?.tag = indexPath.row
            areaHeaderCell?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(areaHeaderEvent)))
            
            areaHeaderCell?.areaHeader.text = dataList[indexPath.row].area_name
            return areaHeaderCell!
        }else if tableView == self.areaDetailTV {
            guard let dataList = self.areaDetailData?.dataList else {
                return UITableViewCell.init()
            }
            
            areaDetailCell = tableView.dequeueReusableCell(withIdentifier: "AreaDetailCell") as? AreaDetailCell
              
            if areaDetailCell == nil {
                areaDetailCell = Bundle.main.loadNibNamed("AreaDetailCell", owner: self, options: nil)?.first as? AreaDetailCell
            }
            
            areaDetailCell?.tag = indexPath.row
            areaDetailCell?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(areaDetailEvent)))
            
            areaDetailCell?.areaName.text = dataList[indexPath.row].area_name
         
            return areaDetailCell!
        }else {
            areaDetailCell = tableView.dequeueReusableCell(withIdentifier: "AreaDetailCell") as? AreaDetailCell
              
            if areaDetailCell == nil {
                areaDetailCell = Bundle.main.loadNibNamed("AreaDetailCell", owner: self, options: nil)?.first as? AreaDetailCell
            }
            
            areaDetailCell?.tag = indexPath.row
            areaDetailCell?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(areaSuggestEvent)))
            
            areaDetailCell?.areaName.text = searchKeywordList[indexPath.row]
         
            return areaDetailCell!
        }
    }

    @objc func areaHeaderEvent(_ gesture: UITapGestureRecognizer) {
        let view = gesture.view
        let tag = view?.tag
        guard let dataList = self.areaHeaderData?.dataList else {
            return
        }
        
        var index:Int = 0
        for _ in dataList {
            self.areaHeaderData?.dataList[index].selectedFlag = false
            index += 1
        }
        
        self.areaHeaderData?.dataList[tag!].selectedFlag = true
        DispatchQueue.main.async {
            self.areaTV.reloadData()
        }
        
        let areaCode = dataList[tag!].area
        let areaName = dataList[tag!].area_name
        self.areaHeader = areaName
        getAreaDetail(callingView: self as Any, areaId: areaCode)
    }
    
    @objc func areaDetailEvent(_ gesture: UITapGestureRecognizer) {
        let view = gesture.view
        let tag = view?.tag
        guard let dataList = self.areaDetailData?.dataList else {
            return
        }
        
        let areaName:String = dataList[tag!].area_name
        if tag! == 0 {
            self.searchResultMove(keyword: areaHeader)
        }else {
            self.searchResultMove(keyword: areaHeader + " " + areaName)
        }
    }
    
    @objc func areaSuggestEvent(_ gesture: UITapGestureRecognizer) {
        let view = gesture.view
        let tag = view?.tag
        
        let areaName:String = self.searchKeywordList[tag!]
        self.searchResultMove(keyword: areaName)
    }
}
