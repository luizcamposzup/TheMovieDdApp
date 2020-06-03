//
//  MovieClient.swift
//  TheMovieDbApp
//
//  Created by zupper on 03/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import Foundation

protocol BaseClient: APIClient {
    func getFeed(from movieFeedType: TheMovieDBAPI, completion: @escaping (Result<MovieResponse?, APIError>) -> Void)
}

class MovieClient: BaseClient {
    
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    convenience init() {
        self.init(session: .shared)
    }
    
    func getFeed(from movieFeedType: TheMovieDBAPI, completion: @escaping (Result<MovieResponse?, APIError>) -> Void) {
        
        let endpoint = movieFeedType
        let request = endpoint.request
        
        fetch(with: request, decode: { json -> MovieResponse? in
            guard let movieFeedResult = json as? MovieResponse else { return  nil }
            return movieFeedResult
        }, completion: completion)
    }
}
