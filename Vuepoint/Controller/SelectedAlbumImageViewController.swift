//
//  SelectedImageViewController.swift
//  Vuepoint
//
//  Created by Jaden Hong on 2022-08-06.
//

import UIKit

class SelectedAlbumImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var album = SelectedAlbumViewController.selectionAlbum
    var index = SelectedAlbumViewController.selectionIndex
    var myImage : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        loadImages()
    }
     
    func loadImages() {
        switch album {
        case "fashionImages":
            myImage = Media.fashionImages[index]
        case "beautyImages":
            myImage = Media.beautyImages[index]
        default:
            myImage = Media.testImage1
        } 
        imageView.image = myImage
        view.addSubview(imageView)
    }

}
