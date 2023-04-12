//
//  PhotosAdapter.swift
//  PhotoCollectionMVP
//
//  Created by Manoj Kumar on 12/04/23.
//

import Foundation
import UIKit
protocol PhotosAdapterDelegate: AnyObject {
    func didTap(_ item: PhotosModel)
    func performPagination(_ page:Int)
}


class PhotosAdapter:NSObject,UICollectionViewDataSource,UICollectionViewDelegate{
    let identifier = "PhotosListCollectionViewCell"
    var photosList:PhotosModel?
    weak var delegate: PhotosAdapterDelegate?
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.photosList?.photos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let photos = self.photosList?.photos,let strURl = photos[indexPath.row].src?.original,let imgURL = URL(string: strURl){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PhotosListCollectionViewCell
            cell.backgroundColor = .cyan
            cell.photoImageView.loadImage(fromurl: imgURL)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //delegate?.performPagination(2)
    }
    
}

extension PhotosAdapter:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let photos = self.photosList?.photos,let height = photos[indexPath.row].height,let width = photos[indexPath.row].width{
            let frameWidth = collectionView.frame.width/2-10
            let newHeight:CGFloat = CGFloat((height/width)) * (collectionView.frame.width/2-10)
            return CGSize(width: frameWidth, height: newHeight)
        }
        return CGSize.zero
    }
}
