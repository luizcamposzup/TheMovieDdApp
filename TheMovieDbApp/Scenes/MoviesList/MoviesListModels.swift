//
//  MoviesListModels.swift
//  TheMovieDbApp
//
//  Created by zupper on 03/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import UIKit

enum MoviesList {
    
    enum FetchMovies {
        
        struct Request {
        }
        
        struct Response {
            var movies : [Movie]?
            var erros : APIError?
        }
        
        struct ViewModel {
            let films : [Film]
            
            struct Film {
                let movieImage: String
                let movieName: String
                let movieDescription: String
            }
        }
    }
    
    enum SearchMovie {
        
        struct Request {
            var movieName : String?
        }
        
        struct Response {
            var movies : [Movie]
        }
        
        struct ViewModel {
            var movieImage : String
            var overview : String?
            var title : String?
        }
    }
    
}
