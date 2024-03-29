//
//  MyCollectionViewCell.swift
//  Vuepoint
//
//  Created by Jaden Hong on 2022-06-12.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    static let collectionIdentifier = "MyCollectionViewCell" 

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCollection(with image: UIImage) {
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    

}
