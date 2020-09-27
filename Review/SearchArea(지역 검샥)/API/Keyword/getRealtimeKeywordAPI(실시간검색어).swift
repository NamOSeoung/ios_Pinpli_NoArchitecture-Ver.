//
//  getRealtimeKeywordAPI(실시간검색어).swift
//  Review
//
//  Created by 남오승 on 2020/09/26.
//  Copyright © 2020 nam_os. All rights reserved.
//

import Foundation
import Alamofire

//상점 조회
@available(iOS 13.0, *)
func getRealtimeKeyword(callingView: Any, keyword:String) {
    
    let decoder = JSONDecoder()
    
    let params = [
        "term" : keyword
    ]
    AF.request(apiAddress+apiVerision+realtimeKeywordURL, method: .get, parameters: params, encoding: URLEncoding.default, headers: ["Content-Type":"application/json", "Accept":"application/json"])
        .responseJSON{ response in
            if response.response?.statusCode == 200 {
                //                print(response.result)
                
                if let responseData = response.data {
                    if let searchKeywordVC:SearchKeywordVC = callingView as? SearchKeywordVC {
                        if let keywordList = try? decoder.decode(Array<String>.self, from: responseData) {
                            print(keywordList)
                            searchKeywordVC.realtimeKeyword = keywordList
                            DispatchQueue.main.async {
                                searchKeywordVC.realtimeKeywordTV.reloadData()
                            }
                        }
                    }else if let searchAreaVC:SearchAreaVC = callingView as? SearchAreaVC {
                        if let keywordList = try? decoder.decode(Array<String>.self, from: responseData) {
                            print(keywordList)
                            searchAreaVC.searchKeywordList = keywordList
                            DispatchQueue.main.async {
                                searchAreaVC.searchKeywordTV.reloadData()
                            }
                        }
                    }
                }
            }else {
                
            }
        }
}
