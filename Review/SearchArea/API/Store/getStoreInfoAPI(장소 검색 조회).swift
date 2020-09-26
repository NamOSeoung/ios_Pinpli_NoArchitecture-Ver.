//
//  getStoreInfoAPI(장소 검색 조회).swift
//  Review
//
//  Created by 남오승 on 2020/09/24.
//  Copyright © 2020 nam_os. All rights reserved.
//


import Foundation
import Alamofire

//상점 조회
@available(iOS 13.0, *)
func getStoreInfo(callingView: Any, keyword:String) {
    
    let decoder = JSONDecoder()
    
    let params = [
        "q" : keyword
    ]
    AF.request(apiAddress+apiVerision+storeInfoURL, method: .get, parameters: params, encoding: URLEncoding.default, headers: ["Content-Type":"application/json", "Accept":"application/json"])
        .responseJSON{ response in
            if response.response?.statusCode == 200 {
                if let responseData = response.data {
                    
                    if let searchResultVC : SearchResultVC = callingView as? SearchResultVC {
                        searchResultVC.storeInfoReturn = try? decoder.decode(StoreInfoReturn.self, from: responseData)
                        
                        DispatchQueue.main.async {
                            searchResultVC.searchResultTV.reloadData()
                        }
                    }else if let homeVC:HomeVC = callingView as? HomeVC {
                        homeVC.storeInfoReturn = try? decoder.decode(StoreInfoReturn.self, from: responseData)
                        
                        DispatchQueue.main.async {
                            homeVC.homeStoreCV.reloadData()
                        }
                    }
                }
            }else {
                
            }
        }
}
