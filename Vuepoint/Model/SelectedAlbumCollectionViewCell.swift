//
//  FashionCollectionViewCell.swift
//  Vuepoint
//
//  Created by Jaden Hong on 2022-06-28.
//

import UIKit

class SelectedAlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!

    static let selectedAlbumIdentifier = "SelectedAlbumCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureFashion(with image: UIImage) {
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "SelectedAlbumCollectionViewCell", bundle: nil)
    }

}
