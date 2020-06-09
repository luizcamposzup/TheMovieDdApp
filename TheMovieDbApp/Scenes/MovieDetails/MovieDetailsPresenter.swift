//
//  MovieDetailsPresenter.swift
//  TheMovieDbApp
//
//  Created by zupper on 08/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import Foundation

protocol MovieDetailsPresentationLogic {
    func presentMovies(request: MovieDetails.SearchMovie.Response)
}

class MovieDetailsPresenter : MovieDetailsPresentationLogic {
    
    weak var viewController: MovieDetailsDisplayLogic?
    
    func presentMovies(request: MovieDetails.SearchMovie.Response){
        let viewModel = format(response: request)
        viewController?.displayMovie(viewModel: viewModel)
    }
    
    func format(response: MovieDetails.SearchMovie.Response) -> MovieDetails.SearchMovie.ViewModel.Film {
        
            let movie = response.movies!
            let movieImage = getImage(from: movie)
            let movieName = getName(from: movie)
            let movieOverview = getDescription(from: movie)
            let voteAverage = getVote(from: movie)
            
        return MovieDetails.SearchMovie.ViewModel.Film(movieImage: movieImage,
                                                      movieName: movieName,
                                                      movieOverview: movieOverview,
                                                      voteAverage: voteAverage)

               
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
        if response.overview == nil || response.overview == "" {
            return "Este filme não possui descrição cadastrada."
        } else {
            return response.overview!
        }
    }
    
    func getVote(from response: Movie) -> Double {
        return response.vote_average!
    }
}
