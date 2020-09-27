//
//  getAreaHeaderAPI(지역 조회-대분류).swift
//  Review
//
//  Created by 남오승 on 2020/09/23.
//  Copyright © 2020 nam_os. All rights reserved.
//

import Foundation
import Alamofire

//지역 조회(대분류)
@available(iOS 13.0, *)
func getAreaHeader(callingView: Any) {
    let decoder = JSONDecoder()
     
    var request = URLRequest(url: URL(string: apiAddress+apiVerision+areaFirstURL)!)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    AF.request(request).responseJSON { response in
        switch response.result {
        case .failure(_): break

        case .success(_):
            if let responseData = response.data {
                if let searchArea : SearchAreaVC = callingView as? SearchAreaVC {
                    searchArea.areaHeaderData = try? decoder.decode(AreaInfoReturn.self, from: responseData)
                    if let dataList = searchArea.areaHeaderData?.dataList {
                        if dataList.count > 0 {
                            var index:Int = 0
                            for _ in dataList {
                                if index == 0 {
                                    searchArea.areaHeaderData?.dataList[index].selectedFlag = true
                                }else {
                                    searchArea.areaHeaderData?.dataList[index].selectedFlag = false
                                }
                                
                                index += 1
                            }
                            searchArea.areaHeader = dataList[0].area_name
                            getAreaDetail(callingView: callingView, areaId: dataList[0].area)
                        }
                    }
                    
                    DispatchQueue.main.async {
                        searchArea.areaTV.reloadData()
                    }
                }
            }
        }
    }
}
