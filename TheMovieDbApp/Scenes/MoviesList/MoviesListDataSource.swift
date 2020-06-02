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
    func didSelectCell(with movie: Movie)
}

class MoviesListDataSource: NSObject {
    
    var movieList: [Movie]
    var collectionView: UICollectionView
    let movieCellIdentifier = "movieCellIdentifier"
    
    weak var delegate: MoviesDatasourceDelegateProtocol?
    
    init(listMovies: [Movie], collectionView: UICollectionView) {
        self.movieList = listMovies
        self.collectionView = collectionView
        super.init()
        self.registerCell()
        self.setupCollectionView()
        movieList = creaeArray()
        
    }
    
    private func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func registerCell() {
        self.collectionView.register(MovieCell.self, forCellWithReuseIdentifier: movieCellIdentifier)
    }
    
    func setMovies(movies: [Movie]) {
        self.movieList = movies
        reloadCollection()
    }
    
    func reloadCollection() {
        collectionView.reloadData()
    }
}


extension MoviesListDataSource: UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellIdentifier, for: indexPath) as! MovieCell
        myCell.setMovie(movie: self.movieList[indexPath.row])
        return myCell
    }
}

extension MoviesListDataSource: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCell(with: self.movieList[indexPath.row])
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

extension MoviesListDataSource {
    
    func creaeArray() -> [Movie] {
        var movies: [Movie] = []
            
            let movie1 = Movie(poster_path: "/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg", adult: nil, overview: nil, release_date: nil, genre_ids: nil, id: nil, original_title: nil, original_language: nil, title: "Avengers: Infinity War", backdrop_path: nil, popularity: nil, vote_count: nil, video: nil, vote_average: nil)
             let movie2 = Movie(poster_path: "/jjPJ4s3DWZZvI4vw8Xfi4Vqa1Q8.jpg", adult: nil, overview: nil, release_date: nil, genre_ids: nil, id: nil, original_title: nil, original_language: nil, title: "Fifty Shades Freed", backdrop_path: nil, popularity: nil, vote_count: nil, video: nil, vote_average: nil)
             let movie3 = Movie(poster_path: "/uxzzxijgPIY7slzFvMotPv8wjKA.jpg", adult: nil, overview: nil, release_date: nil, genre_ids: nil, id: nil, original_title: nil, original_language: nil, title: "Black Panther", backdrop_path: nil, popularity: nil, vote_count: nil, video: nil, vote_average: nil)
             let movie4 = Movie(poster_path: "/rzRwTcFvttcN1ZpX2xv4j3tSdJu.jpg", adult: nil, overview: nil, release_date: nil, genre_ids: nil, id: nil, original_title: nil, original_language: nil, title: "Thor: Ragnarok", backdrop_path: nil, popularity: nil, vote_count: nil, video: nil, vote_average: nil)
             let movie5 = Movie(poster_path: "/sM33SANp9z6rXW8Itn7NnG1GOEs.jpg", adult: nil, overview: nil, release_date: nil, genre_ids: nil, id: nil, original_title: nil, original_language: nil, title: "Zootopia", backdrop_path: nil, popularity: nil, vote_count: nil, video: nil, vote_average: nil)
             let movie6 = Movie(poster_path: "/30oXQKwibh0uANGMs0Sytw3uN22.jpg", adult: nil, overview: nil, release_date: nil, genre_ids: nil, id: nil, original_title: nil, original_language: nil, title: "Rampage", backdrop_path: nil, popularity: nil, vote_count: nil, video: nil, vote_average: nil)
             let movie7 = Movie(poster_path: "/y31QB9kn3XSudA15tV7UWQ9XLuW.jpg", adult: nil, overview: nil, release_date: nil, genre_ids: nil, id: nil, original_title: nil, original_language: nil, title: "Guardians of the Galaxy", backdrop_path: nil, popularity: nil, vote_count: nil, video: nil, vote_average: nil)
             let movie8 = Movie(poster_path: "/nrsx0jEaBgXq4PWo7SooSnYJTv.jpg", adult: nil, overview: nil, release_date: nil, genre_ids: nil, id: nil, original_title: nil, original_language: nil, title: "Geostorm", backdrop_path: nil, popularity: nil, vote_count: nil, video: nil, vote_average: nil)
             let movie9 = Movie(poster_path: "/eKi8dIrr8voobbaGzDpe8w0PVbC.jpg", adult: nil, overview: nil, release_date: nil, genre_ids: nil, id: nil, original_title: nil, original_language: nil, title: "Coco", backdrop_path: nil, popularity: nil, vote_count: nil, video: nil, vote_average: nil)
        

        
        movies.append(movie1)
        movies.append(movie2)
        movies.append(movie3)
        movies.append(movie4)
        movies.append(movie5)
        movies.append(movie6)
        movies.append(movie7)
        movies.append(movie8)
        movies.append(movie9)
        
        return movies
    }
}
