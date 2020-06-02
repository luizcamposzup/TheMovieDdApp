//
//  Movie.swift
//  TheMovieDbApp
//
//  Created by zupper on 01/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//
import UIKit


struct MovieResponse: Decodable {
    let results : [Movie]
}

struct Movie: Decodable {
     let poster_path : String?
     let adult : Bool?
     let overview : String?
     let release_date : String?
     let genre_ids : [Int]?
     let id : Int?
     let original_title : String?
     let original_language : String?
     let title : String?
     let backdrop_path : String?
     let popularity : Double?
     let vote_count : Int?
     let video : Bool?
     let vote_average : Double?
}
