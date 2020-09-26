//
//  AreaHeaderCell.swift
//  Review
//
//  Created by 남오승 on 2020/09/23.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

class AreaHeaderCell:UITableViewCell {
    @IBOutlet weak var areaRightBorder: UIView!
    @IBOutlet weak var areaHeader: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
          //재 사용 시 이미지 리로딩에 관한 부분 처리

    }
}
