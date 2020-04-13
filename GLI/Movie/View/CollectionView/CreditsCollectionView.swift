//
//  CreditsCollectionView.swift
//  GLI
//
//  Created by Avendi Sianipar on 9/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import UIKit

class CreditsCollectionView: XIBView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var credits = [MoviesCreditDetailModel]()
    private let paddingSize: CGFloat = 10
    
    override func initView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CreditsCollectionViewCell.self, forCellWithReuseIdentifier: CreditsCollectionViewCell.identifier)
    }
}

extension CreditsCollectionView : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return credits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreditsCollectionViewCell.identifier, for: indexPath)
        guard let view = cell.viewWithTag(1) as? ProfileRoundedView else { return cell }
        view.setData(name: credits[indexPath.row].name, character: credits[indexPath.row].character,
                     imgPath: credits[indexPath.row].profilePathImage)
        return cell
    }
}

extension CreditsCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: paddingSize, left: paddingSize, bottom: paddingSize, right: paddingSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return paddingSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 134)
    }
}
