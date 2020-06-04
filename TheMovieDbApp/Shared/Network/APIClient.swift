//
//  APIClient.swift
//  TheMovieDbApp
//
//  Created by zupper on 03/06/20.
//  Copyright © 2020 Luizhcarminati. All rights reserved.
//

import Foundation

protocol APIClient {
    
    var session: URLSession { get }
    
    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> MovieResponse?, completion: @escaping (MovieDBResult<T>) -> Void)
}

extension APIClient {
    
    typealias JSONTaskCompletionHandler = (Decodable?, MovieDBError?) -> Void
    
    func decodingTask<T: Decodable>(with request: URLRequest, decodingType: T.Type, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestProblem)
                return
            }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let genericModel = try JSONDecoder().decode(decodingType, from: data)
                        completion(genericModel, nil)
                    } catch {
                        completion(nil, .decodingProblem)
                    }
                } else {
                    completion(nil, .invalidData)
                }
            } else {
                completion(nil, .responseProblem)
            }
        }
        return task
    }
    
    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (MovieDBResult<T>) -> Void) {
        print("fetch Apiclient")
        let task = decodingTask(with: request, decodingType: T.self) { (json , error) in
            //MARK: change to main queue
            DispatchQueue.main.async {
                guard let json = json else {
                    if let error = error {
                        completion(MovieDBResult.failure(error: error))
                    } else {
                        completion(MovieDBResult.failure(error: .invalidData))
                    }
                    return
                }
                if let value = decode(json) {
                    completion(.success(result: value))
                } else {
                    completion(.failure(error: .responseProblem))
                }
            }
        }
        task.resume()
    }
}
