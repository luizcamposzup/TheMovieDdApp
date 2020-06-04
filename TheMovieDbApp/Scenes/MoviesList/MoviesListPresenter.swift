//
//  MoviesListPresenter.swift
//  TheMovieDbApp
//
//  Created by zupper on 03/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import Foundation

protocol MoviesListPresentationLogic {
    func presentMovies(request: MoviesList.FetchMovies.Response)
}


class MoviesListPresenter : MoviesListPresentationLogic {
    
    weak var viewController: MoviesListDisplayLogic?
    
    func presentMovies(request: MoviesList.FetchMovies.Response) {
        let viewModel = MoviesList.FetchMovies.ViewModel()
        viewController?.displayMovies(viewModel: viewModel)
    }
}
