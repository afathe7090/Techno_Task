//
//  MoviesRepositoryImple.swift
//  Techno_Task
//
//  Created by Ahmed Fathy on 05/02/2023.
//

import Combine

final class MoviesRepositoryImple: MoviesRepositoryProrocol {
    
    private let remote: MoviesRepoRemoteProtocol
    @Published private var allMovies: Movies?
    private var anyCancellable = Set<AnyCancellable>()
    
    // MARK: - Init
    init(remote: MoviesRepoRemoteProtocol) {
        self.remote = remote
    }
    // MARK: - Helper Function
    func load() -> AnyPublisher<Movies, Never>{
        return Future { [unowned self] promis in
            if let allMovies = self.allMovies {
                promis(.success(allMovies))
            }else{
                self.remote.load()
                    .replaceError(with: .init(items: nil,errorMessage: nil))
                    .eraseToAnyPublisher()
                    .sink { movies in
                        self.allMovies = movies
                        promis(.success(movies))
                    }.store(in: &self.anyCancellable)
            }
        }.eraseToAnyPublisher()
    }
    
}
