//
//  MovieCell.swift
//  TheMovieDbApp
//
//  Created by zupper on 01/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import Foundation
import UIKit

class MovieCell: UICollectionViewCell {
    
    
    lazy var movieImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var movieTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor.lightGray
        view.textAlignment = .left
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium)
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(movie: Movie) {
        self.movieTitle.text = movie.title
        if let urlMovie = movie.poster_path {
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

extension MovieCell: CodeView {
    func buildViewHierarchy() {
        addSubview(movieImage)
        addSubview(movieTitle)
    }
    
    func setupConstraints() {
        
        movieImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(5)
            make.width.equalTo(90)
        }
        
        movieTitle.snp.makeConstraints { make in
            make.left.equalTo(movieImage.snp.right).offset(10)
            make.centerY.equalTo(movieImage.self)
            make.right.equalToSuperview().inset(10)
        }
    }
}
