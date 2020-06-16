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
    
    
    override func loadView() {
        overrideUserInterfaceStyle = .dark
        self.view = listMovieView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchMovie()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        movieDatasource?.reloadCollection()
    }
    
    fileprivate func setupDatasourceAndDelegates() {
        self.listMovieView.searchDelegate = self
        self.movieDatasource?.delegate = self
    }
    
    func setup() {
        let viewController = self
        let interactor = MoviesListInteractor()
        let presenter = MoviesListPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
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
        
        let vc = MovieDetailsViewController(with: movie)
        vc.modalPresentationStyle = .automatic
        self.present(vc, animated: true, completion: nil)
    }
}
