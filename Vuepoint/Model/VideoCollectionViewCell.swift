//
//  VideoCollectionViewCell.swift
//  Vuepoint
//
//  Created by Jaden Hong on 2022-06-15.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var videoImageView: UIImageView! 
    
    static let videoIdentifier = "VideoCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib() 
    }
     
    
    func configureVideo(with image: UIImage) {
        videoImageView.image = image
        videoImageView.contentMode = .scaleAspectFill
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "VideoCollectionViewCell", bundle: nil)
    }
    

}
