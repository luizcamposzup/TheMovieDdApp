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
}

extension Endpoint {
    
    var apiKey: String {
        return "6ffc22f834981cf940f64d919e57daf1"
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        let apiQuery = URLQueryItem(name: "api_key", value: apiKey)
        let languageQuery = URLQueryItem(name: "language", value: query)
        components.queryItems = [apiQuery, languageQuery]
        components.queryItems = components.queryItems?.filter { $0.value != nil}
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum TheMovieDBAPI {
    case popular
}


extension TheMovieDBAPI : Endpoint {
    
    var base: String {
        return "https://api.themoviedb.org/3/"
    }
    
    var query: String? {
        return "language=pt-BR"
    }
    
    var path: String {
        return "/3/movie/popular"
    }
}
