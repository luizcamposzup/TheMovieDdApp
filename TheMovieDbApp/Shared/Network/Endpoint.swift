//
//  Endpoint.swift
//  TheMovieDbApp
//
//  Created by zupper on 03/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import Foundation

protocol Endpoint {
    
    var base: String { get }
    var path: String { get }
    var query: String? { get }
    var language: String? { get }
}

extension Endpoint {
    
    var apiKey: String {
        return "6ffc22f834981cf940f64d919e57daf1"
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        let searchQuery = URLQueryItem(name: "query", value: query)
        let apiQuery = URLQueryItem(name: "api_key", value: apiKey)
        let languageQuery = URLQueryItem(name: "language", value: language)
        components.queryItems = [apiQuery,searchQuery, languageQuery]
        components.queryItems = components.queryItems?.filter { $0.value != nil}
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum TheMovieDbAPI {
    case popular
    case search(nameMovie: String)
}


extension TheMovieDbAPI : Endpoint {
    
    var base: String {
        return "https://api.themoviedb.org/3/"
    }
    
    var query:  String? {
        switch self {
        case .search(let movieName):
            return "\(movieName)"
        default:
            return nil
        }
    }
    
    var path: String {
        switch self {
        case .popular:
            return "/3/movie/popular"
        case .search:
            return "/3/search/movie"
        }
    }
    
    var language: String? {
        return "language=pt-BR"
    }
}
