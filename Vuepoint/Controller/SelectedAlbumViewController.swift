//
//  FashionViewController.swift
//  Vuepoint
//
//  Created by Jaden Hong on 2022-06-27.
//

import UIKit

private let goToImage = "goToImage"

class SelectedAlbumViewController: UIViewController {
    
    static var selectionIndex : Int = 0
    static var selectionAlbum : String = ""
    
    @IBOutlet var collectionView: UICollectionView!
    
    var selectedAlbumImage = SelectedAlbumImageViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        
        collectionView.register(SelectedAlbumCollectionViewCell.nib(), forCellWithReuseIdentifier: SelectedAlbumCollectionViewCell.selectedAlbumIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
     

}

extension SelectedAlbumViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedAlbum = Media.albumList[AlbumsViewController.albumNumber]
        print("\(selectedAlbum) Tapped at \(indexPath.row)")
          
        SelectedAlbumViewController.selectionIndex = indexPath.row
        SelectedAlbumViewController.selectionAlbum = selectedAlbum
        
        performSegue(withIdentifier: goToImage, sender: nil)
    }
}

extension SelectedAlbumViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectedAlbumCollectionViewCell.selectedAlbumIdentifier, for: indexPath) as! SelectedAlbumCollectionViewCell
        
        switch AlbumsViewController.albumNumber {
        case 0:
            print("fashion")
            cell.configureFashion(with: Media.fashionImages[indexPath.row])
        case 1:
            print("beauty")
            cell.configureFashion(with: Media.beautyImages[indexPath.row])
        default:
            print("default")
        }
        
        cell.layer.cornerRadius = 12
        cell.backgroundColor = .systemPink
        
        return cell
    }
}

extension SelectedAlbumViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.bounds.width/3.2
        let height = view.bounds.height/4
        let size = CGSize(width: width, height: height)
        return size
    }
}

