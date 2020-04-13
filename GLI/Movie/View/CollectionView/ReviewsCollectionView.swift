//
//  ReviewsCollectionView.swift
//  GLI
//
//  Created by Avendi Sianipar on 9/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import UIKit

class ReviewsCollectionView: XIBView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let paddingSize: CGFloat = 10
    
    let reviewClicked = ObservableData<MoviesReviewsDetailModel>()
    var reviews = [MoviesReviewsDetailModel]() {
        didSet {
            titleLabel.text = "Top \(reviews.count) Users Reviews"
        }
    }
        
    override func initView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ReviewsCollectionViewCell.self, forCellWithReuseIdentifier: ReviewsCollectionViewCell.identifier)
    }
}

extension ReviewsCollectionView : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewsCollectionViewCell.identifier, for: indexPath)
        guard let view = cell.viewWithTag(1) as? UserReviews else { return cell }
        view.setData(author: reviews[indexPath.row].author, content: reviews[indexPath.row].content)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if reviews.count > 0 { reviewClicked.value = reviews[indexPath.row] }
    }
}

extension ReviewsCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: paddingSize, left: paddingSize, bottom: paddingSize, right: paddingSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return paddingSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/1.5, height: 80)
    }
}

