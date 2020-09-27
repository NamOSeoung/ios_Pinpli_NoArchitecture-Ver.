//
//  HomeStoreCell.swift
//  Review
//
//  Created by 남오승 on 2020/09/24.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class HomeStoreCell:UICollectionViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeScore: UILabel!
    private var task: URLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func prepareForReuse() {
        //재 사용 시 이미지 리로딩에 관한 부분 처리
        //예시 https://stackoverflow.com/questions/35958826/swift-images-change-to-wrong-images-while-scrolling-after-async-image-loading-to
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
