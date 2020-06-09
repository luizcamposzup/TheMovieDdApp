//
//  MovieDetailsViewController.swift
//  TheMovieDbApp
//
//  Created by zupper on 08/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import UIKit

protocol MovieDetailsDisplayLogic: class {
    func displayMovie(viewModel: MovieDetails.SearchMovie.ViewModel.Film)
}

class MovieDetailsViewController: UIViewController, MovieDetailsDisplayLogic {
    
    var interactor: MovieDetailsBusinessLogic?
    let movieDetailsView: MovieDetailsView = MovieDetailsView()
    let movie: MoviesList.FetchMovies.ViewModel.Film
    
    
    override func loadView() {
        overrideUserInterfaceStyle = .dark
        self.view = movieDetailsView
    }
    
    init(with movie: MoviesList.FetchMovies.ViewModel.Film) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
        
    }

    required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        searchMovie()
    }
    

    func setup() {
        let viewController = self
        let interactor = MovieDetailsInteractor()
        let presenter = MovieDetailsPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    func searchMovie(){
        let id = movie.movieId
        let request = MovieDetails.SearchMovie.Request(movieId: id)
        interactor?.searchIdMovie(request: request)
    }
    
    func displayMovie(viewModel: MovieDetails.SearchMovie.ViewModel.Film) {
        self.movieDetailsView.setMovie(movie: viewModel)
    }
}
