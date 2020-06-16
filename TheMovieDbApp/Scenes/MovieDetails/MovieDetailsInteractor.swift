//
//  MovieDetailsInteractor.swift
//  TheMovieDbApp
//
//  Created by zupper on 08/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import UIKit

protocol MovieDetailsBusinessLogic {
    func searchIdMovie(request: MovieDetails.SearchMovie.Request)
}

protocol MovieDetailsDataSource {
    var presenter: MovieDetailsPresentationLogic? { get }
}

class MovieDetailsInteractor : MovieDetailsBusinessLogic, MovieDetailsDataSource {
 
    var presenter: MovieDetailsPresentationLogic?
    var worker: MoviesListWorker?
    var movies: Movie?
    
    func searchIdMovie(request: MovieDetails.SearchMovie.Request) {
        worker = MoviesListWorker()
        worker?.searchIdMovie(from: .searchId(movieId: request.movieId), completion: { result in
            
            switch result {
            case .success(let data):
                self.movies = data
                let response = MovieDetails.SearchMovie.Response(movies: self.movies, error: nil)
                self.presenter?.presentMovies(request: response)
            case .failure(let error):
                let response = MovieDetails.SearchMovie.Response(movies: nil , error: error)
                self.presenter?.presentMovies(request: response)
                print(error)
            }
        })
    }
}

