//
//  MovieDetailViewController.swift
//  GLI
//
//  Created by Avendi Sianipar on 8/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import UIKit
import RxSwift

class MovieDetailViewController: BaseViewController {
    
    @IBOutlet private weak var bannerDescritionView: BannerDescriptionView!
    @IBOutlet private weak var trailerCollectionView: TralierCollectionView!
    @IBOutlet private weak var creditsCollectionView: CreditsCollectionView!
    @IBOutlet private weak var reviewsCollectionView: ReviewsCollectionView!
    
    private let disposable = DisposeBag()
    private let viewModel = MoviesDetailViewModel()
    
    var movieIdSelected: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        bannerDescritionView.isHidden = true
        trailerCollectionView.isHidden = true
        creditsCollectionView.isHidden = true
        reviewsCollectionView.isHidden = true
        viewModel.getMovieDetail(id: movieIdSelected)
    }
}

private extension MovieDetailViewController {
    func initViewModel() {
        viewModel.isLoading.observe(disposable) { (data) in
            guard let isLoading = data else { return }
            self.showLoading(isLoading)
        }
        
        viewModel.errorMsgValidation.observe(disposable) { (data) in
            guard let msgError = data else { return }
            self.showAlert(msg: msgError)
        }
        
        viewModel.moviesDetail.observe(disposable) { (data) in
            guard var data = data else { return }
            self.bannerDescritionView.isHidden = false
            self.bannerDescritionView.setData(title: data.title, overview: data.overview, imgPath: data.backdropPathImage)

            guard let videos = data.videos else { return }
            self.trailerCollectionView.videos = videos
            self.trailerCollectionView.isHidden = false
            self.trailerCollectionView.collectionView.reloadData()   
        }
        
        viewModel.casting.observe(disposable) { (data) in
            guard let cast = data?.cast else { return }
            self.creditsCollectionView.isHidden = false
            self.creditsCollectionView.credits = cast
            self.creditsCollectionView.collectionView.reloadData()
        }
        
        viewModel.reviews.observe(disposable) { (data) in
            guard let review = data?.results else { return }
            self.reviewsCollectionView.isHidden = false
            self.reviewsCollectionView.reviews = review
            self.reviewsCollectionView.collectionView.reloadData()
        }
        
        trailerCollectionView.trailerClicked.observe(disposable) { (data) in
            guard let url = data?.youtubeURL else { return }
            self.openURL(withURL: url)
        }
        
        reviewsCollectionView.reviewClicked.observe(disposable) { (data) in
            guard let data = data, let url = URL(string: data.url) else { return }
            self.openURL(withURL: url)
        }
    }
    
    func openURL(withURL url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
