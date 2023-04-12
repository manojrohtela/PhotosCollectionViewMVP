//
//  ViewController.swift
//  PhotoCollectionMVP
//
//  Created by Manoj Kumar on 12/04/23.
//

import UIKit

class ViewController: UIViewController {

    
    let adapter = PhotosAdapter()
    let presenter = PhotosPresenter()
    @IBOutlet weak var photoCollectionView:UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        adapter.delegate = self
        presenter.getPhotos(page: 1)
        photoCollectionView.delegate = adapter
        photoCollectionView.dataSource = adapter
        photoCollectionView.register(UINib(nibName: adapter.identifier, bundle: nil), forCellWithReuseIdentifier: adapter.identifier)
        // Do any additional setup after loading the view.
    }


}

extension ViewController:PhotosAdapterDelegate{
    func didTap(_ item: PhotosModel) {
        
    }
    
    func performPagination(_ page: Int) {
        
    }
    
    
}

extension ViewController:PhotosView{
    func setPhotos(photos: PhotosModel) {
        adapter.photosList = photos
        DispatchQueue.main.async {
            self.photoCollectionView.reloadData()
        }
        
    }
}
