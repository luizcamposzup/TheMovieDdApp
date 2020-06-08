//
//  MoviesListViewController.swift
//  TheMovieDbApp
//
//  Created by zupper on 01/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import UIKit

protocol MoviesListDisplayLogic: class {
    func displayMovies(viewModel: MoviesList.FetchMovies.ViewModel)
}

class MoviesListViewController: UIViewController, MoviesListDisplayLogic {
    
    var interactor: MoviesListBusinessLogic?
    let listMovieView: ListMovieView = ListMovieView()
    var movieDatasource: MoviesListDataSource?
    var router: (NSObjectProtocol & MoviesListRoutingLogic & MoviesListDataPassing)?
    
    override func loadView() {
        overrideUserInterfaceStyle = .dark
        self.view = listMovieView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies"
        setup()
        fetchMovie()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        movieDatasource?.reloadCollection()
    }
    
    fileprivate func setupDatasourceAndDelegates() {
        self.movieDatasource?.delegate = self
        self.listMovieView.searchDelegate = self
        
    }
    
    func setup() {
        let viewController = self
        let interactor = MoviesListInteractor()
        let presenter = MoviesListPresenter()
        let router = MoviesListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataSource = interactor
    }
    
    func fetchMovie(){
        let request = MoviesList.FetchMovies.Request(movieName: nil, page: 1)
        interactor?.fetchMovies(request: request)
    }
    
    func displayMovies(viewModel: MoviesList.FetchMovies.ViewModel) {
        
        self.movieDatasource = MoviesListDataSource(listMovies: viewModel,
                                                    collectionView: listMovieView.collectionView)
        setupDatasourceAndDelegates()
    }
    
}

extension MoviesListViewController: MoviesListSearchProtocol {
    
    func searchMovies(nameMovie: String) {
        let request = MoviesList.FetchMovies.Request(movieName: nameMovie)
        interactor?.searchMovie(request: request)
    }
}

extension MoviesListViewController: MoviesDatasourceDelegateProtocol {
    func didSelectCell(with movie: MoviesList.FetchMovies.ViewModel.Film) {
        
    }
}



//func addMovies(newMovies: [Movie]) {
//    self.movies.append(contentsOf: newMovies)
//    self.reloadCollection()
//}
