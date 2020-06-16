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
                                                  movieOverview: getDescription(from: $0),
                                                  movieId: getId(from: $0))
        })
        
        return MoviesList.FetchMovies.ViewModel(films: itens ?? [])
        
    }
    
    func getImage(from response: Movie) -> String {
        
        if response.poster_path == nil {
            return ""
        } else {
            return response.poster_path!
        }
    }
    
    func getName(from response: Movie) -> String {
        return response.title!
    }
    
    func getDescription(from response: Movie) -> String {
        if response.overview == nil {
            return "Este filme não possui descrição cadastrada."
        } else {
            return response.overview!
        }
    }
    
    func getId(from response: Movie) -> Int {
        return response.id!
    }
}
