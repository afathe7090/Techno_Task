//
//  MoviesRepoRemoteImple.swift
//  Techno_Task
//
//  Created by Ahmed Fathy on 05/02/2023.
//

import Combine
import AFNetwork
typealias MoviesError = NetworkError
final class MoviesRepoRemoteImple: MoviesRepoRemoteProtocol {
    
    func load() -> AnyPublisher<Movies, MoviesError> {
        SesstionNetwork.instance.requestPublisher(type: Movies.self, endpoint: MovieService.loadMovie)
    }
}
