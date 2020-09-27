//
//  getBookmarkAPI(북마크 조회).swift
//  Review
//
//  Created by 남오승 on 2020/09/27.
//  Copyright © 2020 nam_os. All rights reserved.
//

import Foundation
import Alamofire

//북마크 조회
@available(iOS 13.0, *)
func getBookmark(callingView: Any, gubun:String) {
    
    let decoder = JSONDecoder()
    
    let params = [
        "gubun" : gubun,
        "user_id" : "jeetkn@naver.com",
        "sns_division" : "C"
    ]
    AF.request(apiAddress+apiVerision+bookmarkURL, method: .get, parameters: params, encoding: URLEncoding.default, headers: ["Content-Type":"application/json", "Accept":"application/json"])
        .responseJSON{ response in
            if response.response?.statusCode == 200 {
                if let responseData = response.data {
                    if let likeStoreVC : LikeStoreVC = callingView as? LikeStoreVC {
                        likeStoreVC.bookmarkInfoReturn = try? decoder.decode(BookmarkInfoReturn.self, from: responseData)
                        
                        DispatchQueue.main.async {
                            likeStoreVC.likeTV.reloadData()
                        }
                    }
                }
            }else {
                
            }
        }
}
