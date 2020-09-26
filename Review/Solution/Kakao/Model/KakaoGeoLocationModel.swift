//
//  KakaoGeoLocationModel.swift
//  Review
//
//  Created by 남오승 on 2020/09/24.
//  Copyright © 2020 nam_os. All rights reserved.
//

import Foundation

struct CurrentLocationInfoReturnData : Codable{
    let meta:ApiTotalCnt?
    let documents : [CurrentLocationInfo]?
}

struct ApiTotalCnt: Codable {
    let total_count: Int?
}
struct CurrentLocationInfo : Codable {
    let address : CurrentLocationAddresInfo?
    let road_address : CurrentLocationLoadAddresInfo?
}

struct CurrentLocationAddresInfo:  Codable {
    let address_name : String
    let region_1depth_name : String
    let region_2depth_name : String
    let region_3depth_name : String
    let mountain_yn : String
    let main_address_no : String
    let sub_address_no : String
    let zip_code : String
}

struct CurrentLocationLoadAddresInfo:  Codable {
    let address_name : String
    let region_1depth_name : String
    let region_2depth_name : String
    let region_3depth_name : String
    let road_name : String
    let underground_yn : String
    let main_building_no : String
    let sub_building_no : String
    let building_name : String
    let zone_no : String
}
