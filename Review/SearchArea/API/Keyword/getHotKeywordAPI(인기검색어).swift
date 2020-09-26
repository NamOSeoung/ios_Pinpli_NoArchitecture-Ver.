//
//  getHotKeywordAPI(인기검색어).swift
//  Review
//
//  Created by 남오승 on 2020/09/26.
//  Copyright © 2020 nam_os. All rights reserved.
//

import Foundation
import Alamofire

//인기검색어
@available(iOS 13.0, *)
func getHotKeyword(callingView: Any) {

    let decoder = JSONDecoder()
    var request = URLRequest(url: URL(string: apiAddress+apiVerision+hotKeywordURL)!)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    AF.request(request).responseJSON { response in
        switch response.result {
        case .failure(_): break

        case .success(_):
            if let responseData = response.data {
                if let hotKeywordVC : HotKeywordVC = callingView as? HotKeywordVC {
                    hotKeywordVC.hotKeywordReturnData = try? decoder.decode(HotKeywordReturnData.self, from: responseData)
                    DispatchQueue.main.async {
                        hotKeywordVC.hotKeywordTV.reloadData()
                    }
                }
            }
        }
    }
}
