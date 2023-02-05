//
//  MoviesRepoRemoteProtocol.swift
//  Techno_Task
//
//  Created by Ahmed Fathy on 05/02/2023.
//

import Combine

protocol MoviesRepoRemoteProtocol: AnyObject {
    func load() -> AnyPublisher<Movies, MoviesError>
}
