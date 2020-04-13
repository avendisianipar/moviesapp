//
//  TralierCollectionView.swift
//  GLI
//
//  Created by Avendi Sianipar on 9/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import UIKit

class TralierCollectionView: XIBView {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var videos = [Video]()
    let trailerClicked = ObservableData<Video>()
    private let paddingSize: CGFloat = 10
    
    override func initView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TralierCollectionViewCell.self,
                                forCellWithReuseIdentifier: TralierCollectionViewCell.identifier)
    }
}

extension TralierCollectionView : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TralierCollectionViewCell.identifier, for: indexPath)
        guard let thumbnailURL = videos[indexPath.row].youtubeThumbnailURL, let view = cell.viewWithTag(1) as? YoutubePreviewView else { return cell }
        view.bannerImageView.setImage(withURL: thumbnailURL, completion: nil)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if videos.count > 1 { trailerClicked.value = videos[indexPath.row] }
    }
}

extension TralierCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: paddingSize, left: paddingSize, bottom: paddingSize, right: paddingSize)
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return paddingSize
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 200)
    }
}
