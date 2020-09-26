//
//  HomeCV.swift
//  Review
//
//  Created by 남오승 on 2020/09/24.
//  Copyright © 2020 nam_os. All rights reserved.
//

import UIKit

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        if collectionView == self.homeYoutubeCV {
            guard let dataList = self.youtubeInfoReturn?.dataList else {
                return 0
            }
            
            if dataList.count > 5 { //조회결과가 5개 이상이면 5개까지만 보여주기
                return 5
            }else { //5개 이하면 그냥 다보여줘도됨.
                return dataList.count
            }
        }else if collectionView == self.homeNaverCV {
            guard let dataList = self.naverInfoReturn?.dataList else {
                return 0
            }
            
            if dataList.count > 5 { //조회결과가 5개 이상이면 5개까지만 보여주기
                return 5
            }else { //5개 이하면 그냥 다보여줘도됨.
                return dataList.count
            }
        }else if collectionView == self.homeTstoryCV {
            guard let dataList = self.tistoryInfoReturn?.dataList else {
                return 0
            }
            
            if dataList.count > 5 { //조회결과가 5개 이상이면 5개까지만 보여주기
                return 5
            }else { //5개 이하면 그냥 다보여줘도됨.
                return dataList.count
            }
        }else {
            guard let dataList = self.storeInfoReturn?.dataList else {
                return 0
            }
                
            if dataList.count > 5 { //조회결과가 5개 이상이면 5개까지만 보여주기
                return 5
            }else { //5개 이하면 그냥 다보여줘도됨.
                return dataList.count
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == self.homeYoutubeCV {
            guard let dataList = self.youtubeInfoReturn?.dataList else {
                return UICollectionViewCell.init()
            }
            homeYoutubeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeYoutubeCell", for: indexPath) as? HomeYoutubeCell
            
            let subject:String = dataList[indexPath.row].title!
            let thumbnail:String = dataList[indexPath.row].thumbnail_url!
            
            homeYoutubeCell?.subject.text = subject
            homeYoutubeCell?.thumbnailSetting(urlString: thumbnail)
            
            return homeYoutubeCell!
        }else if collectionView == self.homeNaverCV {
            guard let dataList = self.naverInfoReturn?.dataList else {
                return UICollectionViewCell.init()
            }
            homeReviewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeReviewCell", for: indexPath) as? HomeReviewCell
            
            let subject:String = dataList[indexPath.row].title!
            let thumbnail:String = dataList[indexPath.row].thumbnail_url!
            let writeDate:String = dataList[indexPath.row].write_date!
            
            homeReviewCell?.subject.text = subject
            homeReviewCell?.thumbnailSetting(urlString: thumbnail)
            homeReviewCell?.writeDate.text = writeDate
            
            return homeReviewCell!
        }else if collectionView == self.homeTstoryCV {
            guard let dataList = self.tistoryInfoReturn?.dataList else {
                return UICollectionViewCell.init()
            }
            homeReviewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeReviewCell", for: indexPath) as? HomeReviewCell
            
            let subject:String = dataList[indexPath.row].title!
            let thumbnail:String = dataList[indexPath.row].thumbnail_url!
            let writeDate:String = dataList[indexPath.row].write_date!
            
            homeReviewCell?.subject.text = subject
            homeReviewCell?.thumbnailSetting(urlString: thumbnail)
            homeReviewCell?.writeDate.text = writeDate
            return homeReviewCell!
        }else {
            guard let dataList = self.storeInfoReturn?.dataList else {
                return UICollectionViewCell.init()
            }
            
            homeStoreCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeStoreCell", for: indexPath) as? HomeStoreCell
            
            let placeName:String = dataList[indexPath.row].place_name
            let categoryName:String = dataList[indexPath.row].category_name
            
            if let appRating:String = dataList[indexPath.row].app_rating {
                homeStoreCell?.storeScore.text = "★ \(appRating)"
            }else {
                if let googleRating:String = dataList[indexPath.row].google_rating {
                    homeStoreCell?.storeScore.text = "★ \(googleRating)"
                }else {
                    homeStoreCell?.storeScore.text = "★ 0.0"
                }
            }
            
            if let appThumbnail:String = dataList[indexPath.row].app_thumbnail {
                homeStoreCell?.thumbnailSetting(urlString: appThumbnail)
            }else {
                if let blogThumbnail:String = dataList[indexPath.row].blog_thumbnail {
                    homeStoreCell?.thumbnailSetting(urlString: blogThumbnail)
                }else {
                    homeStoreCell?.thumbnail.image = UIImage(named: "storeImageNo")
                }
            }
            
            homeStoreCell?.category.text = categoryName
            homeStoreCell?.storeName.text = placeName
            
            return homeStoreCell!
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.homeYoutubeCV {
            guard let dataList = self.youtubeInfoReturn?.dataList else {return}
            
            if let url:String = dataList[indexPath.row].url {
                portalReviewMove(url: url)
            }
           
        }else if collectionView == self.homeNaverCV {
            guard let dataList = self.naverInfoReturn?.dataList else {return}
            if let url:String = dataList[indexPath.row].url {
                portalReviewMove(url: url)
            }
        }else if collectionView == self.homeTstoryCV {
            guard let dataList = self.tistoryInfoReturn?.dataList else {return}
            if let url:String = dataList[indexPath.row].url {
                portalReviewMove(url: url)
            }
        }else {
            guard let dataList = self.storeInfoReturn?.dataList else {return}
                
            
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == homeStoreCV {
            let size = CGSize(width: 170.0, height: 202.0)

            return size
        }else if collectionView == homeYoutubeCV {
            let size = CGSize(width: 205.0, height: 166.0)

            return size
        }else {
            let size = CGSize(width: 160.0, height: 206.0)

            return size
        }
    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 30.0
//    }
////
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 30.0
//    }
//
}
