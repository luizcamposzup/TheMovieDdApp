//
//  APIError.swift
//  TheMovieDbApp
//
//  Created by zupper on 03/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import Foundation

enum APIError: Error {
    
    case responseProblem
    case decodingProblem
    case encodingProblem
    case requestProblem
    case invalidData
}
