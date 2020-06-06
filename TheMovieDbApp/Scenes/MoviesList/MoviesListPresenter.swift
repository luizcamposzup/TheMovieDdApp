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
    
    func presentMovies(request: MoviesList.FetchMovies.Response){
        let viewModel = format(response: request)
        viewController?.displayMovies(viewModel: viewModel)
    }
    
    func format(response: MoviesList.FetchMovies.Response) -> MoviesList.FetchMovies.ViewModel {
        let itens = response.movies?.map({
            MoviesList.FetchMovies.ViewModel.Film(movieImage: getImage(from: $0),
                                                  movieName: getName(from: $0),
                                                  movieDescription: getDescription(from: $0))
        })
        
        return MoviesList.FetchMovies.ViewModel(films: itens ?? [])
        
    }
    
    func getImage(from response: Movie) -> String {
        return response.poster_path!
    }
    
    func getName(from response: Movie) -> String {
        return response.title!
    }
    
    func getDescription(from response: Movie) -> String {
        return response.overview!
    }
}
