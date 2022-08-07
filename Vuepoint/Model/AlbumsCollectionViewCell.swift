//
//  AlbumsCollectionViewCell.swift
//  Vuepoint
//
//  Created by Jaden Hong on 2022-06-27.
//

import UIKit

class AlbumsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    static let albumIdentifier = "AlbumsCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureAlbum(with image: UIImage) {
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
    }
    
    static func nib() -> UINib  {
        return UINib(nibName: "AlbumsCollectionViewCell", bundle: nil) 
    }

}
