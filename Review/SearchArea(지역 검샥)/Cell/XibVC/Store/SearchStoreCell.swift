//
//  SearchStoreCell.swift
//  Review
//
//  Created by 남오승 on 2020/09/24.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class SearchStoreCell:UITableViewCell {

    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var openGL: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    @IBOutlet weak var placeName: UILabel!
    
    @IBOutlet weak var category: UILabel!
    
    @IBOutlet weak var bookmarkImage: UIImageView!
    
    @IBOutlet weak var reviewMoreBtn: UIButton!
    private var task: URLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
