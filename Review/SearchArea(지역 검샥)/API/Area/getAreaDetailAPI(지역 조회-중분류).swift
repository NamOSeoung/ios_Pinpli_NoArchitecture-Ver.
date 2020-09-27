//
//  getAreaDetailAPI(지역 조회 - 중분류).swift
//  Review
//
//  Created by 남오승 on 2020/09/23.
//  Copyright © 2020 nam_os. All rights reserved.
//

import Foundation
import Alamofire

//지역 조회(대분류)
@available(iOS 13.0, *)
func getAreaDetail(callingView: Any, areaId:String) {

    let decoder = JSONDecoder()
    var request = URLRequest(url: URL(string: apiAddress+apiVerision+areaSecondURL+"?area="+areaId)!)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    AF.request(request).responseJSON { response in
        switch response.result {
        case .failure(_): break

        case .success(_):
            if let responseData = response.data {
                if let searchArea : SearchAreaVC = callingView as? SearchAreaVC {
                    searchArea.areaDetailData = try? decoder.decode(AreaInfoReturn.self, from: responseData)
                    DispatchQueue.main.async {
                        searchArea.areaDetailTV.reloadData()
                    }
                }
            }
        }
    }
}
