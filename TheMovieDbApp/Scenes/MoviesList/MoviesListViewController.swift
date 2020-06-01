//
//  MoviesListViewController.swift
//  TheMovieDbApp
//
//  Created by zupper on 01/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    let listMovieView: ListMovieView = ListMovieView()
    
    override func loadView() {
        overrideUserInterfaceStyle = .dark
        self.view = listMovieView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
