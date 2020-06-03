//
//  ListMovieView.swift
//  TheMovieDbApp
//
//  Created by zupper on 01/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class ListMovieView: UIView {
    
    weak var searchDelegate: MoviesListSearchProtocol?
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: self.flowLayout)
        collectionView.backgroundColor = .systemGray5
        return collectionView
    }()
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 12 , left: 12, bottom: 12, right: 12)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        return flowLayout
    }()
    
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
         view.placeholder = "Digite o nome do filme."
         view.delegate = self
         return view
     }()
}

extension ListMovieView: CodeView {
    
    func buildViewHierarchy() {
        
        self.addSubview(self.searchBar)
        self.addSubview(self.collectionView)
    }
    
    func setupConstraints() {
        
        self.searchBar.snp.makeConstraints { make in
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.top.equalToSuperview().offset(40)
        }
        
        self.collectionView.snp.makeConstraints { make in
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.top.equalTo(self.searchBar.snp.bottom)
            make.bottom.equalTo(self)
        }
    }
}

extension ListMovieView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if !searchText.isEmpty {
            self.searchDelegate?.searchMovies(nameMovie: searchText)
        }
    }
}

