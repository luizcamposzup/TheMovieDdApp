//
//  MovieDetailsView.swift
//  TheMovieDbApp
//
//  Created by zupper on 08/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import UIKit
import SnapKit

class MovieDetailsView: UIView {   
    
    
//    lazy var backButton: UIButton = {
//        let view = UIButton(frame: .zero)
//        view.setImage(UIImage(systemName: "arrow.left"), for: .normal)
//        view.tintColor = .yellow
//        return view
//    }()
    
    lazy var movieImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .white
        view.alpha = 0.4
        return view
    }()
    
    lazy var favoriteButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(systemName: "star"), for: .normal)
        view.tintColor = .yellow
        return view
    }()
    
    lazy var movieTitle: UITextView = {
        let view = UITextView(frame: .zero)
        view.textColor = .white
        view.backgroundColor = UIColor.systemGray5.withAlphaComponent(0.2)
        view.layer.cornerRadius = 20
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        return view
    }()
    
    lazy var vote: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .yellow
        view.alpha = 0.7
        view.textAlignment = .left
        view.numberOfLines = 1
        view.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        return view
    }()
    
    lazy var overviewLabel: UITextView = {
        let view = UITextView(frame: .zero)
        view.textColor = .white
        view.backgroundColor = UIColor.systemGray5.withAlphaComponent(0.2)
         view.layer.cornerRadius = 20
        view.textAlignment = .justified
        view.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium)
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMovie(movie: MovieDetails.SearchMovie.ViewModel.Film) {
        getImageFromUrl(imageUrl: movie)

        self.movieTitle.text = "Title: \(movie.movieName)"
        self.overviewLabel.text = movie.movieOverview
        self.vote.text = "Rating: \(movie.voteAverage)/10"
    }
    
    func getImageFromUrl(imageUrl: MovieDetails.SearchMovie.ViewModel.Film){
        if imageUrl.movieImage == "" {
            self.movieImage.image = UIImage(named: "NoImage")
        } else {
            let urlMovie = imageUrl.movieImage
            let url = URL(string:
                "https://image.tmdb.org/t/p/w300\(urlMovie)")
            
            let task = URLSession.shared.dataTask(with: url!) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async() {    // execute on main thread
                    self.movieImage.image = UIImage(data: data)
                }
            }
            task.resume()
        }
    }
}

extension MovieDetailsView : CodeView {
    func buildViewHierarchy() {
//        self.addSubview(backButton)
        self.addSubview(movieImage)
        self.addSubview(favoriteButton)
        self.addSubview(movieTitle)
        self.addSubview(vote)
        self.addSubview(overviewLabel)
    }
    
    func setupConstraints() {
    
        movieImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            
        }
        
        favoriteButton.snp.makeConstraints { (make) in
            make.top.equalTo(movieImage.snp.top)
            make.right.equalToSuperview().inset(20)
            make.height.width.equalTo(60)
        }
        
//        backButton.snp.makeConstraints { (make) in
//            make.top.equalTo(movieImage.snp.top)
//            make.left.equalToSuperview().inset(20)
//            make.height.width.equalTo(60)
//        }
        
        vote.snp.makeConstraints { (make) in
            make.top.equalTo(favoriteButton.snp.bottom).offset(330)
            make.left.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        movieTitle.snp.makeConstraints { (make) in
            make.top.equalTo(vote.snp.bottom).offset(15)
            make.left.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
        
        overviewLabel.snp.makeConstraints { (make) in
            make.top.equalTo(movieTitle.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .systemGray6
    }
    
    
}
