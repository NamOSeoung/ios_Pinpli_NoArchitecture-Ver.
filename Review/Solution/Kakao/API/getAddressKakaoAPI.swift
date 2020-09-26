//
//  getAddressKakaoAPI.swift
//  Review
//
//  Created by 남오승 on 2020/09/24.
//  Copyright © 2020 nam_os. All rights reserved.
//

import Foundation
import Alamofire

//지역 조회(대분류)
@available(iOS 13.0, *)
func getAddressKakao(callingView: Any, keyword:String) {

    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    
    let params = [
        "query" : "종암동"
    ]
    AF.request(kakaoAddress+addressKakaoUrl+".json", method: .get, parameters: params, encoding: URLEncoding.default, headers: ["Content-Type":"application/json", "Accept":"application/json", "Authorization":kakaoAK + " " + kakaoRestApiKey])
          .responseJSON{ response in
              if response.response?.statusCode == 200 {
                print(response.result)
                  if let responseData = response.data {
                          do {
                            if let parseJSON = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] {
                                   if let data = parseJSON["documents"] as? [String:Any]  {
                                    print(data)
//                                            print("data\(data)")
                                }
                            }

                            let decoder = JSONDecoder()
                         
                          } catch let error as NSError {
                           print("response:\(response.response!)")
                              print("Failed to load: \(error.localizedDescription)")
                          }
                  }
              }else {
                  if let responseData = response.data {
                      do {
                          // make sure this JSON is in the format we expect
                          if let parseJson = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] {
                          }
                      } catch let error as NSError {
                       print("response:\(response.response!)")
                          print("Failed to load: \(error.localizedDescription)")
                      }
                   print("response:\(response.response!)")
                  print("statusCode: \(response.response!.statusCode)")
              }
          }
    }
    
}
