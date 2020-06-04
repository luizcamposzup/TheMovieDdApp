//
//  MoviesListWorker.swift
//  TheMovieDbApp
//
//  Created by zupper on 04/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import UIKit

class MoviesListWorker {
    
    var movieClient:  MovieDBProtocol
    
    
    init(movieClient : MovieDBProtocol) {
          self.movieClient = movieClient
      }
    
    func getFeed(from movieFeedType: TheMovieDbAPI, completion: @escaping FetchMoviesCompletionHandler){
        print("worker")
        movieClient.getFeed(from: .popular) { result in
            switch result {
            case .success(let data):
                completion(.success(result: data))
            case .failure(let error):
                completion(.failure(error: error))
            }
        }
    }
}




