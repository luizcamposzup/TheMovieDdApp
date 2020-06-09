//
//  MovieDetailsmodels.swift
//  TheMovieDbApp
//
//  Created by zupper on 08/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import UIKit

enum MovieDetails {
    
    enum SearchMovie {
        
        struct Request {
            var movieId : Int
        }
        
        struct Response {
            var movies : Movie?
            var error : APIError?
        }
        
        struct ViewModel {
            let films : Film
            
            struct Film {
                let movieImage: String
                let movieName: String
                let movieOverview: String
                let voteAverage: Double
            }
        }
    }
}
