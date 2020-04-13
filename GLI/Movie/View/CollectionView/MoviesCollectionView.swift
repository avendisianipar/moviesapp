//
//  MoviesCollectionView.swift
//  GLI
//
//  Created by Avendi Sianipar on 8/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import UIKit

class MoviesCollectionView: UICollectionView {
    
    private var currentPage: Int = 1
    private let columnCount: CGFloat = 2
    private let paddingSize: CGFloat = 10

    var totalPages: Int = 1
    var movies = [MoviesResultsModel]()
    let loadMore = ObservableData<Int>()
    let didSelectItem = ObservableData<MoviesResultsModel>()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        initView()
    }
    
    func initView(){
        delegate = self
        dataSource = self
        register(MoviePosterCollectionCell.self,
                 forCellWithReuseIdentifier: MoviePosterCollectionCell.identifier)
    }
}

extension MoviesCollectionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: MoviePosterCollectionCell.identifier, for: indexPath)
        guard let view = cell.viewWithTag(1) as? PosterView else { return cell }
        view.setData(title: movies[indexPath.row].title, imgPath: movies[indexPath.row].posterPathImage)
        return cell
    }
        
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if (maximumOffset - currentOffset) <= 200, currentPage < totalPages {
            currentPage += 1
            loadMore.value = currentPage
        }
    }
}

extension MoviesCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: paddingSize, left: paddingSize, bottom: paddingSize, right: paddingSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return paddingSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return getSize()
    }
    
    private func getSize() -> CGSize {
        let padding = paddingSize * (columnCount + 1)
        let availableWidth = frame.width - padding
        let width = Int(availableWidth / columnCount)
        let height = width + 100
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if movies.count > 1 { didSelectItem.value = movies[indexPath.row] }
    }
}
