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
        self.setupDatasourceAndDelegates()
        setup()
        fetchMovie()
        print("viewdidload")
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           movieDatasource?.reloadCollection()
       }
    
    fileprivate func setupDatasourceAndDelegates() {
           self.movieDatasource = MoviesListDataSource(listMovies: [], collectionView: listMovieView.collectionView)
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
        print("setup")
    }
    
    func fetchMovie(){
        let request = MoviesList.FetchMovies.Request()
        interactor?.fetchMovies(request: request)
        print("fetchmoviesVC")
    }
    
    func search() {
        let request = MoviesList.SearchMovie.Request(movieName: "teste")
        interactor?.searchMovie(request: request)
    }
    
//    private func fetchDoors() {
//        startLoading(with: R.string.localizable.searchingNearestDoor())
//        let request = Unlock.FetchDoors.Request()
//        interactor?.fetchDoors(request: request)
//    }
    
    func displayMovies(viewModel: MoviesList.FetchMovies.ViewModel) {
       //passar response da api
        
       }
    
}

extension MoviesListViewController: MoviesListSearchProtocol {
    
    func searchMovies(nameMovie: String) {
        let request = MoviesList.SearchMovie.Request(movieName: nameMovie)
//        interactor?.fetchMovies(request: request)
    }
}

extension MoviesListViewController: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension MoviesListViewController: MoviesDatasourceDelegateProtocol {
    func didSelectCell(with movie: Movie) {
        
    }
}

