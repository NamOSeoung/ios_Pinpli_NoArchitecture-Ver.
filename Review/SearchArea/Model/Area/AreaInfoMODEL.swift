//
//  AreaInfoMODEL.swift
//  Review
//
//  Created by 남오승 on 2020/09/23.
//  Copyright © 2020 nam_os. All rights reserved.
//

import Foundation

struct AreaInfoReturn : Codable{
    let code : Int
    let message : String
    var dataList : [AreaInfo]
}

struct AreaInfo : Codable {
    let area : String
    let area_name : String
    var selectedFlag : Bool?
}
