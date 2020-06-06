//
//  MoviesListDataSource.swift
//  TheMovieDbApp
//
//  Created by zupper on 02/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import Foundation
import UIKit

protocol MoviesDatasourceDelegateProtocol: class {
    func didSelectCell(with movie: MoviesList.FetchMovies.ViewModel.Film)
}

class MoviesListDataSource: NSObject {
    
    var movieList : MoviesList.FetchMovies.ViewModel
    var collectionView: UICollectionView
    let movieCellIdentifier = "movieCellIdentifier"
    
    weak var delegate: MoviesDatasourceDelegateProtocol?
    
    init(listMovies: MoviesList.FetchMovies.ViewModel, collectionView: UICollectionView) {
        
        self.movieList = listMovies
        self.collectionView = collectionView
        super.init()
        self.registerCell()
        self.setupCollectionView()
        self.setMovies(movies: listMovies)
        
    }
    
    private func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func registerCell() {
        self.collectionView.register(MovieCell.self, forCellWithReuseIdentifier: movieCellIdentifier)
    }
    
    func setMovies(movies: MoviesList.FetchMovies.ViewModel) {
        self.movieList = movies
        reloadCollection()
    }
    
    func reloadCollection() {
        collectionView.reloadData()
    }
}


extension MoviesListDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movieList.films.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellIdentifier, for: indexPath) as! MovieCell
        myCell.setMovie(movie: self.movieList.films[indexPath.row])
        return myCell
    }
}

extension MoviesListDataSource: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCell(with: self.movieList.films[indexPath.row])
    }
    
}


extension MoviesListDataSource:  UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = collectionView.bounds.height / 2.5
        let collectionPadding = CGFloat(45)
        let collectionWidth = collectionView.bounds.width - collectionPadding
        let cellWidth = collectionWidth / 2
        
        return CGSize(width: cellWidth, height: cellHeight);
    }
}
