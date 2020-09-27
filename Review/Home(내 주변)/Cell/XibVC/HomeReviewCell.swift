//
//  HomeReviewCell.swift
//  Review
//
//  Created by 남오승 on 2020/09/24.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

//유튜브를 제외한 나머지 공통
class HomeReviewCell:UICollectionViewCell {

    private var task: URLSessionDataTask?
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var writeDate: UILabel!
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    
    override func prepareForReuse() {
          //재 사용 시 이미지 리로딩에 관한 부분 처리
        task?.cancel()
        task = nil

        thumbnail.image = nil
    }
    
    func thumbnailSetting(urlString: String) {
        if task == nil {
            // Ignore calls when reloading
            task = thumbnail.downloadImage(from: urlString)
        }
    }
}
