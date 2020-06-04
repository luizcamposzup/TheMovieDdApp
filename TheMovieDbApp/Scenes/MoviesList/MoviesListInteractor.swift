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
        print("fetchmovie interactor")
        worker = MoviesListWorker(movieClient: MovieClient())
        print("2")
        worker?.getFeed(from: .popular, completion: { result in
            print("1")
            switch result {
            case .success(let data):
                self.movies = data
                let response = MoviesList.FetchMovies.Response(results: data)
                print(data)
                self.presenter?.presentMovies(request: response)
            case .failure(let error):
                print(error)
            }
        })
        
//        let response = MoviesList.FetchMovies.Response(results: MovieResponse)
//        presenter?.presentMovies(request: response)
    }
    
    func searchMovie(request: MoviesList.SearchMovie.Request) {
        worker = MoviesListWorker(movieClient: MovieClient())
        worker?.getFeed(from: .search(nameMovie: request.movieName!), completion: { result in
                   
                   switch result {
                   case .success(let data):
                       self.movies = data
                       let response = MoviesList.FetchMovies.Response(results: data)
                       self.presenter?.presentMovies(request: response)
                   case .failure(let error):
                   print(error)
                   }
               })
        
    }
}
