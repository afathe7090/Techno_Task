//
//  MoviesUseCase.swift
//  Techno_Task
//
//  Created by Ahmed Fathy on 05/02/2023.
//

import Combine

enum SortedTypes {
    case year
    case rate
}

class MoviesUseCase: MoviesUseCaseProtocol {
    
    private let repo: MoviesRepositoryProrocol
    init(repo: MoviesRepositoryProrocol) {
        self.repo = repo
    }
    
    func load(by sorted: SortedTypes) -> AnyPublisher<[MoviesItem], Never> {
        repo.load().map({
            return $0.items!.sorted(by: { r1, r2 in
                switch sorted {
                case .year: return Double(r1.year ?? "0.0")! > Double(r2.year ?? "0.0")!
                case .rate: return Double(r1.imDBRating ?? "0.0")! > Double(r2.imDBRating ?? "0.0")!
                }
            })
        }).eraseToAnyPublisher()
    }
    
}


