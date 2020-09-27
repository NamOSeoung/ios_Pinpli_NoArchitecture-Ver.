//
//  HotKeywordMODEL.swift
//  Review
//
//  Created by 남오승 on 2020/09/26.
//  Copyright © 2020 nam_os. All rights reserved.
//

import Foundation

struct HotKeywordReturnData:Codable {
    let code :Int
    let message : String
    let dataList: [HotKeywordData]
    
}
struct HotKeywordData :Codable{
    let index:Int
    let search_word:String
}
