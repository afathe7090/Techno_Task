//
//  MoviesUseCaseProtocol.swift
//  Techno_Task
//
//  Created by Ahmed Fathy on 05/02/2023.
//

import Combine
protocol MoviesUseCaseProtocol: AnyObject {
    func load(by sorted: SortedTypes) -> AnyPublisher<[MoviesItem], Never> 
}
