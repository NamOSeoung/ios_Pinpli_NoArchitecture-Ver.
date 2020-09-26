//
//  ReviewModel.swift
//  Review
//
//  Created by 남오승 on 2020/09/26.
//  Copyright © 2020 nam_os. All rights reserved.
//

import Foundation

struct ReviewModelReturnData : Codable {
    let code : Int
    let message : String
    let dataList : [ReviewModelData]
}

struct ReviewModelData : Codable {
    let index : String?
    let start_index : String?
    let review_id : String?
    let title : String?
    let write_date :String?
    let author : String?
    let description : String?
    let url : String?
    let thumbnail : String?
    let thumbnail_url : String?
    let bookmark_flag : Bool?
}
