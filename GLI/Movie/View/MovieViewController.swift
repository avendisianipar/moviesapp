//
//  MovieViewController.swift
//  GLI
//
//  Created by Avendi Sianipar on 8/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import UIKit
import RxSwift

class MovieViewController: BaseViewController {

    @IBOutlet private weak var collectionView: MoviesCollectionView!
    
    private let disposable = DisposeBag()
    private let viewModel = MoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        viewModel.getConfiguration()
    }
}

private extension MovieViewController {
    func initViewModel() {
        viewModel.isLoading.observe(disposable) { (data) in
            guard let isLoading = data else { return }
            self.showLoading(isLoading)
        }
        
        viewModel.errorMsgValidation.observe(disposable) { (data) in
            guard let msgError = data else { return }
            self.showAlert(msg: msgError)
        }
                
        viewModel.movies.observe(disposable) { (data) in
            guard let data = data else { return }
            if data.page == 1 {
                self.collectionView.movies = data.results
            } else {
                self.collectionView.movies += data.results
            }
            self.collectionView.totalPages = data.total_pages
            self.collectionView.reloadData()
        }
        
        collectionView.loadMore.observe(disposable) { (data) in
            guard let nextPage = data else { return }
            self.viewModel.getPopularMovies(page: nextPage)
        }
        
        collectionView.didSelectItem.observe(disposable) { (data) in
            guard let movieId = data?.id else { return }
            self.toMovieDetail(movieId: movieId)
        }
    }
    
    func toMovieDetail(movieId: Int) {
        let controller = MovieDetailViewController.instantiate(appStoryboard: .Movie)
        controller.movieIdSelected = movieId
        navigationController?.pushViewController(controller, animated: true)
    }
}

