//
//  SearchResultTV.swift
//  Review
//
//  Created by 남오승 on 2020/09/24.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

extension SearchResultVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataList = self.storeInfoReturn?.dataList else {
            return 0
        }
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let dataList = self.storeInfoReturn?.dataList else {
            return UITableViewCell.init()
        }
        
        searchStoreCell = tableView.dequeueReusableCell(withIdentifier: "SearchStoreCell") as? SearchStoreCell
          
        if searchStoreCell == nil {
            searchStoreCell = Bundle.main.loadNibNamed("SearchStoreCell", owner: self, options: nil)?.first as? SearchStoreCell
        }
        let placeName:String = dataList[indexPath.row].place_name
        let categoryName:String = dataList[indexPath.row].category_name
        let appReviewCount:Int = Int(dataList[indexPath.row].app_review_count)!
        let googleReviewCount:Int = Int(dataList[indexPath.row].google_review_count)!
        let naverReviewCount:Int = Int(dataList[indexPath.row].naver_blog_count)!
        let daumReviewCount:Int = Int(dataList[indexPath.row].daum_blog_count)!
        let youtubeReviewCount:Int = Int(dataList[indexPath.row].youtube_review_count)!
        
        if let appThumbnail:String = dataList[indexPath.row].app_thumbnail {
            searchStoreCell?.thumbnailSetting(urlString: appThumbnail)
        }else {
            if let blogThumbnail:String = dataList[indexPath.row].blog_thumbnail {
                searchStoreCell?.thumbnailSetting(urlString: blogThumbnail)
            }
        }
        
        let reviewTotalCoutn:String = "\(appReviewCount+googleReviewCount+naverReviewCount+daumReviewCount+youtubeReviewCount)"
        searchStoreCell?.reviewMoreBtn.setTitle(reviewTotalCoutn+"개의 리뷰 모아보기>", for: .normal)
        searchStoreCell?.placeName.text = placeName
        searchStoreCell?.category.text = categoryName

        return searchStoreCell!
    }

//    @objc func areaHeaderEvent(_ gesture: UITapGestureRecognizer) {
//        let view = gesture.view
//        let tag = view?.tag
//        guard let dataList = self.areaHeaderData?.dataList else {
//            return
//        }
//
//        var index:Int = 0
//        for _ in dataList {
//            self.areaHeaderData?.dataList[index].selectedFlag = false
//            index += 1
//        }
//
//        self.areaHeaderData?.dataList[tag!].selectedFlag = true
//        DispatchQueue.main.async {
//            self.areaTV.reloadData()
//        }
//
//        let areaCode = dataList[tag!].area
//        let areaName = dataList[tag!].area_name
//        self.areaHeader = areaName
//        getAreaDetail(callingView: self as Any, areaId: areaCode)
//    }
//
//    @objc func areaDetailEvent(_ gesture: UITapGestureRecognizer) {
//        let view = gesture.view
//        let tag = view?.tag
//        guard let dataList = self.areaDetailData?.dataList else {
//            return
//        }
//
//        let areaName:String = dataList[tag!].area_name
//        if tag! == 0 {
//            self.searchResultMove(keyword: areaName)
//        }else {
//            self.searchResultMove(keyword: areaHeader + " " + areaName)
//        }
//    }
}
