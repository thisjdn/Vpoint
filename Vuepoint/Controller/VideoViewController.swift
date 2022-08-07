//
//  FashionViewController.swift
//  Vuepoint
//
//  Created by Jaden Hong on 2022-06-12.
//

import UIKit
import AVKit
import AVFoundation

private let videoIdentifier = "VideoCollectionViewCell"

class VideoViewController: UIViewController {
    
    var player = AVPlayer()
    var playerViewController = AVPlayerViewController()
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        
        collectionView.register(VideoCollectionViewCell.nib(), forCellWithReuseIdentifier: videoIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension VideoViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        playVideo(at: indexPath)
    }
    
    func playVideo(at indexPath: IndexPath) {
        
        let path = Bundle.main.path(forResource: Media.videos[indexPath.row], ofType: ".mp4")
        let urlWithPath = URL(fileURLWithPath: path!)
        let player = AVPlayer(url: urlWithPath)
        
        playerViewController.player = player
        self.present(playerViewController, animated: true, completion: {
            self.playerViewController.player?.play()
        })
    }
    
    
}

extension VideoViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Media.videoImages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { 
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: videoIdentifier, for: indexPath) as! VideoCollectionViewCell
        
        cell.configureVideo(with: Media.videoImages[indexPath.row])
        
        cell.layer.cornerRadius = 12

        return cell
    }
}

extension VideoViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let minInset: CGFloat = 16
        let width = (collectionView.safeAreaLayoutGuide.layoutFrame.width) - (minInset * 2)
        let height = min(306, width)
        
        
        let size = CGSize(width: width, height: height)
        return size
    }
    
    
}




