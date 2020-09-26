//
//  getAreaSuggestAPI(지역 전체 조회 - 검색용).swift
//  Review
//
//  Created by 남오승 on 2020/09/26.
//  Copyright © 2020 nam_os. All rights reserved.
//

import Foundation
import Alamofire

//지역 전체조회 검색용
func getAreaSuggest(callingView: Any) {
    let decoder = JSONDecoder()
    var request = URLRequest(url: URL(string: apiAddress+apiVerision+areaSuggest)!)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    AF.request(request).responseJSON { response in
        switch response.result {
        case .failure(_): break

        case .success(_):
            if let responseData = response.data {
                if let searchArea : SearchAreaVC = callingView as? SearchAreaVC {
                    if let dataList = try? decoder.decode(AreaSuggessReturn.self, from: responseData).dataList {
                        searchArea.areaSuggestList = dataList
                    }
                }
            }
        }
    }
}
