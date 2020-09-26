//
//  StoreInfoMODEL.swift
//  Review
//
//  Created by 남오승 on 2020/09/24.
//  Copyright © 2020 nam_os. All rights reserved.
//

import Foundation

struct StoreInfoReturn : Codable{
    let code : Int
    let message : String
    var dataList : [StoreInfo]
}

struct StoreInfo : Codable {
    let place_name : String
    let place_id : String
    let latitude : String
    let longitude : String
    let place_address : String
    let road_place_address : String
    let open_hours : String?
    let google_rating : String?
    let app_rating : String?
    let google_place_id : String?
    let kakao_place_id : String
    let naver_place_id : String?
    let blog_thumbnail : String?
    let app_thumbnail : String?
    let category_name : String
    let naver_blog_count : String
    let daum_blog_count : String
    let google_review_count : String
    let youtube_review_count : String
    let app_review_count : String
}
