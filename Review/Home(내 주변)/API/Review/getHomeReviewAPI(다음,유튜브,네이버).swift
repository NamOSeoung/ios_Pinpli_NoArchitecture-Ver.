//
//  getYoutubeInfoAPI(유튜브 리뷰 검색).swift
//  Review
//
//  Created by 남오승 on 2020/09/26.
//  Copyright © 2020 nam_os. All rights reserved.
//

import Foundation
import Alamofire

//상점 조회
@available(iOS 13.0, *)
func getHomeReviewAPI(callingView: Any, keyword:String ,portal:String) {
    let decoder = JSONDecoder()
    
    let params = [
        "query" : keyword,
        "portal" : portal
    ]
    AF.request(apiAddress+apiVerision+homeReviewInfoURL, method: .get, parameters: params, encoding: URLEncoding.default, headers: ["Content-Type":"application/json", "Accept":"application/json"])
        .responseJSON{ response in
            if response.response?.statusCode == 200 {
                if let responseData = response.data {

                    if let homeVC : HomeVC = callingView as? HomeVC {
                        if portal == "YOUTUBE" {
                            homeVC.youtubeInfoReturn = try? decoder.decode(ReviewModelReturnData.self, from: responseData)
                            DispatchQueue.main.async {
                                homeVC.homeYoutubeCV.reloadData()
                            }
                        }else if portal == "NAVER" {
                            homeVC.naverInfoReturn = try? decoder.decode(ReviewModelReturnData.self, from: responseData)
                            DispatchQueue.main.async {
                                homeVC.homeNaverCV.reloadData()
                            }
                        }else {
                            homeVC.tistoryInfoReturn = try? decoder.decode(ReviewModelReturnData.self, from: responseData)
                            DispatchQueue.main.async {
                                homeVC.homeTstoryCV.reloadData()
                            }
                        }
                    }
                }
            }else {
                
            }
        }
}
