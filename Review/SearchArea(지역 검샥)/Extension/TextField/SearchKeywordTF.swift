//
//  SearchKeywordTF.swift
//  Review
//
//  Created by 남오승 on 2020/09/22.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
extension SearchKeywordVC: UITextFieldDelegate {
    
    // 키워드 작성 시 이벤트
    @objc func textFieldDidChange(textField: UITextField) {
        self.viewInit()
    }
}

