//
//  MovieDBProtocol.swift
//  TheMovieDbApp
//
//  Created by zupper on 04/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import Foundation


protocol MovieDBProtocol : APIClient {
    func getFeed(from movieFeedType: TheMovieDbAPI, completion: @escaping FetchMoviesCompletionHandler)
}

class MovieClient: MovieDBProtocol {
    
    
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    convenience init() {
        self.init(session: .shared)
    }
    
    func fetch<T>(with request: URLRequest, decode: @escaping (Decodable) -> MovieResponse?, completion: @escaping (MovieDBResult<T>) -> Void) where T : Decodable {
       }
    

    func getFeed(from movieFeedType: TheMovieDbAPI, completion: @escaping FetchMoviesCompletionHandler) {
        let endpoint = movieFeedType
        let request = endpoint.request
        print("client")
        
        fetch(with: request, decode: { json -> MovieResponse? in
            print("client fetch")
            guard let movieFeedResult = json as? MovieResponse else {
                print(" error client fetch")
                return nil
            }
            return movieFeedResult
        }, completion: completion)
    }
    
}
