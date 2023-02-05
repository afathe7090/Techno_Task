//
//  MoviesRepositoryProrocol.swift
//  Techno_Task
//
//  Created by Ahmed Fathy on 05/02/2023.
//

import Combine

protocol MoviesRepositoryProrocol: AnyObject {
    func load() -> AnyPublisher<Movies, Never>
}
