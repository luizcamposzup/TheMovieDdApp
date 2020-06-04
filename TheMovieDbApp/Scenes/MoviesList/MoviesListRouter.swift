//
//  MoviesListRouter.swift
//  TheMovieDbApp
//
//  Created by zupper on 03/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import UIKit

@objc protocol MoviesListRoutingLogic {
}

protocol MoviesListDataPassing {
    var dataSource : MovieListDataSource? { get }
}

class MoviesListRouter: NSObject, MoviesListRoutingLogic, MoviesListDataPassing {
    
    
    
    weak var viewController: MoviesListViewController?
    var dataSource: MovieListDataSource?
    
    
}
