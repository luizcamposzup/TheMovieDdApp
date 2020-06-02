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
    var movieDatasource: MoviesListDataSource?
    
    override func loadView() {
        overrideUserInterfaceStyle = .dark
        self.view = listMovieView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies"
        self.setupDatasourceAndDelegates()
        

    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           movieDatasource?.reloadCollection()
       }
    
    fileprivate func setupDatasourceAndDelegates() {
           self.movieDatasource = MoviesListDataSource(listMovies: [], collectionView: listMovieView.collectionView)
//        self.movieDatasource?.delegate = self

       }
    
}


