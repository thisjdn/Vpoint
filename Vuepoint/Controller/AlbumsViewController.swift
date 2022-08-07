//
//  AlbumsViewController.swift
//  Vuepoint
//
//  Created by Jaden Hong on 2022-06-27.
//

import UIKit

class AlbumsViewController: UIViewController {
    
    static var albumNumber: Int = 0 {
        didSet{
            print("didSet -> current: \(albumNumber)")
        }
    }
    
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        
        collectionView.collectionViewLayout = layout
        
        collectionView.register(AlbumsCollectionViewCell.nib(), forCellWithReuseIdentifier: AlbumsCollectionViewCell.albumIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension AlbumsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Album selected with -> \(indexPath.row)!")
        
        AlbumsViewController.albumNumber = indexPath.row
        performSegue(withIdentifier: "goToAlbum", sender: nil)
        
    } 
}

extension AlbumsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Media.albumImages.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumsCollectionViewCell.albumIdentifier, for: indexPath) as! AlbumsCollectionViewCell
        cell.configureAlbum(with: Media.albumImages[indexPath.row])
        
        cell.layer.cornerRadius = 12
        
        return cell
    }
}

extension AlbumsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let minInset: CGFloat = 16
        let width = (collectionView.safeAreaLayoutGuide.layoutFrame.width) - (minInset * 2)
        let height = min(306, width)
        
        let size = CGSize(width: width, height: height)
        return size
    }
}

