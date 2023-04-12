//
//  PhotosPresenter.swift
//  PhotoCollectionMVP
//
//  Created by Manoj Kumar on 13/04/23.
//

import Foundation
protocol PhotosView:NSObjectProtocol{
    func setPhotos(photos:PhotosModel)
}


class PhotosPresenter{
    weak private var photoView:PhotosView?
    init(){}
    
    func attachView(view:PhotosView){
        photoView = view
    }
    
    func detachView(){
        photoView = nil
    }
    
    func getPhotos(page:Int,per_page:Int = 10){
        let photoRequest = PhotoRequestModel(page: page)
        let photoResource = PhotosResource()
        photoResource.getPhotos(photoRequest: photoRequest) { result in
            guard let result = result else {return}
            self.photoView?.setPhotos(photos: result)
        }
    }
}
