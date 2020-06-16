//
//  Result.swift
//  TheMovieDbApp
//
//  Created by zupper on 03/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import Foundation

typealias FetchMoviesCompletionHandler = (MovieDBResult<[Movie]>) -> Void

enum MovieDBResult<U> {
    case success(result: U)
    case failure(error: MovieDBError)
}

enum MovieDBError: Error {
    
    case responseProblem
    case decodingProblem
    case encodingProblem
    case requestProblem
    case invalidData
}
