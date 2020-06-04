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
            var results : [Movie]
        }
        
        struct ViewModel {
            var poster_path : String?
            var title : String?
        }
    }
    
    enum SearchMovie {
        
        struct Request {
            var movieName : String?
        }
        
        struct Response {
            var results : MovieResponse
        }
        
        struct ViewModel {
            var poster_path : String?
            var title : String?
        }
    }
    
}
