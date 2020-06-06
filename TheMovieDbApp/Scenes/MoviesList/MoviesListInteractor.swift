//
//  MoviesListInteractor.swift
//  TheMovieDbApp
//
//  Created by zupper on 03/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import UIKit

protocol MoviesListBusinessLogic {
    func fetchMovies(request: MoviesList.FetchMovies.Request)
    func searchMovie(request: MoviesList.SearchMovie.Request)
}

protocol MovieListDataSource {
    var presenter: MoviesListPresentationLogic? { get }
}

class MoviesListInteractor : MoviesListBusinessLogic, MovieListDataSource {
    
    var presenter: MoviesListPresentationLogic?
    var worker: MoviesListWorker?
    var movies: [Movie]?
    
    func fetchMovies(request: MoviesList.FetchMovies.Request) {
        worker = MoviesListWorker()
        worker?.getFeed(from: .popular, completion: { result in
            switch result {
            case .success(let data):
                self.movies = data!.results
                let response = MoviesList.FetchMovies.Response(movies: self.movies)
                self.presenter?.presentMovies(request: response)
            case .failure(let error):
                let response = MoviesList.FetchMovies.Response(movies: nil , erros: error)
                self.presenter?.presentMovies(request: response)
                print(error)
            }
        })
    }
    
    func searchMovie(request: MoviesList.SearchMovie.Request) {
        worker = MoviesListWorker()
        worker?.getFeed(from: .search(nameMovie: request.movieName!), completion: { result in
            
            switch result {
            case .success(let data):
                self.movies = data!.results
                let response = MoviesList.FetchMovies.Response(movies: self.movies, erros: nil)
                self.presenter?.presentMovies(request: response)
            case .failure(let error):
                let response = MoviesList.FetchMovies.Response(movies: nil , erros: error)
                self.presenter?.presentMovies(request: response)
                print(error)
            }
        })
    }
}


