//
//  Result.swift
//  TheMovieDbApp
//
//  Created by zupper on 03/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Error  {
    case success(T)
    case failure(U)
}
