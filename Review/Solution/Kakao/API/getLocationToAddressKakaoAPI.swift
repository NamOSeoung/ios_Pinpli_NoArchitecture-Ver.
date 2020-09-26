//
//  getLocationToAddressKakaoAPI.swift
//  Review
//
//  Created by 남오승 on 2020/09/24.
//  Copyright © 2020 nam_os. All rights reserved.
//

import Foundation
import Alamofire

//지역 조회(대분류)
@available(iOS 13.0, *)
func getLocationToAddressKakao(callingView: Any, longitude:Double, latitude:Double) {

    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    
    let params = [
        "x" : "\(longitude)",
        "y" : "\(latitude)"
    ]
    AF.request(kakaoAddress+locationToAddressKakaoUrl+".json", method: .get, parameters: params, encoding: URLEncoding.default, headers: ["Content-Type":"application/json", "Accept":"application/json", "Authorization":kakaoAK + " " + kakaoRestApiKey])
          .responseJSON{ response in
              if response.response?.statusCode == 200 {
                  if let responseData = response.data {
                    print("?")
                    if let searchAreaVC:SearchAreaVC = callingView as? SearchAreaVC {
                        if let kakaoDocuments = try? decoder.decode(CurrentLocationInfoReturnData.self, from: responseData).documents {
                            if let address = kakaoDocuments[0].address {
                                searchAreaVC.searchResultMove(keyword: address.address_name)
                            }
                        }
                    }else if let homeVC:HomeVC = callingView as? HomeVC {
                        if let kakaoDocuments = try? decoder.decode(CurrentLocationInfoReturnData.self, from: responseData).documents {
                            if let address = kakaoDocuments[0].address {
                                let currentAddress:String = address.region_1depth_name + " " + address.region_2depth_name + " " + address.region_3depth_name
                                homeVC.locationWellcomeGL.text = currentAddress + " 맛집\n여긴 어때요 😋"
                                homeVC.currentAddress = currentAddress
                                homeVC.reviewGL.text = currentAddress + " 맛집의 리뷰들을\n모아서 한 번에 확인해 보세요"
                                getStoreInfo(callingView: callingView, keyword: currentAddress)
                                getHomeReviewAPI(callingView: callingView, keyword: currentAddress+"맛집",portal:"YOUTUBE")
                                getHomeReviewAPI(callingView: callingView, keyword: currentAddress+"맛집",portal:"NAVER")
                                getHomeReviewAPI(callingView: callingView, keyword: currentAddress+"맛집",portal:"DAUM")
                            }
                        }
                    }
                  }
              }else {
//                  if let responseData = response.data {
//                      do {
//                          // make sure this JSON is in the format we expect
//                          if let parseJson = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] {
//                          }
//                      } catch let error as NSError {
//                       print("response:\(response.response!)")
//                          print("Failed to load: \(error.localizedDescription)")
//                      }
//                   print("response:\(response.response!)")
//                  print("statusCode: \(response.response!.statusCode)")
//              }
          }
    }
    
}
