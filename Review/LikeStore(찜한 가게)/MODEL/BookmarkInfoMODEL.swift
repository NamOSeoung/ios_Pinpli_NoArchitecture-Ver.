//
//  BookmarkMODEL.swift
//  Review
//
//  Created by 남오승 on 2020/09/27.
//  Copyright © 2020 nam_os. All rights reserved.
//

import Foundation

struct BookmarkInfoReturn : Codable{
    let code : Int
    let message : String
    var dataList : [BookmarkInfo]
}

struct BookmarkInfo : Codable {
    let gubun : String
    let place_id : String
    let place_name : String
    let category_name : String
    let place_address : String
    let road_place_address : String
    let latitude : String
    let longitude : String
    let open_hours : String
    let google_rating : Double
    let app_rating : Double
    let thumbnail : String
    let naver_blog_count : Int
    let daum_blog_count : Int
    let google_review_count : Int
    let youtube_review_count : Int
    let app_review_count : Int
}
