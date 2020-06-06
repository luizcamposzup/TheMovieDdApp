//
//  MoviesListWorker.swift
//  TheMovieDbApp
//
//  Created by zupper on 04/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import UIKit

class MoviesListWorker {
    
    var moviesClient:  MovieDBProtocol = MoviesClient()
    
    func getFeed(from movieFeedType: TheMovieDbAPI, completion: @escaping (Result<MovieResponse?, APIError>) -> Void){
        moviesClient.getFeed(from: movieFeedType) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
                print(error)
            }
        }
    }
    
    func getImageFromUrl(imageUrl: String?) -> UIImage {
        var movieImage = UIImage()
        if let urlMovie = imageUrl {
            let url = URL(string:
                "https://image.tmdb.org/t/p/w300\(urlMovie)")
            
            let task = URLSession.shared.dataTask(with: url!) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async() {    // execute on main thread
                    movieImage = UIImage(data: data)!
                }
            }
            task.resume()
        }
        return movieImage
    }
}




