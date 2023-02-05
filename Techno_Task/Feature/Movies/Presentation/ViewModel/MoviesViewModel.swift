//
//  MoviesViewModel.swift
//  Techno_Task
//
//  Created by Ahmed Fathy on 05/02/2023.
//

import Combine

final class MoviesViewModel:MoviesViewModelProtocol, ViewModel{
    
    // MARK: - Classes Helper
    class Input {}
    class Output {
        @Published var itemViewModel: MoviesDatasourcesViewModel?
    }
    
    // MARK: - Proberties
    var input: Input = .init()
    var output: Output = .init()
    private let useCase: MoviesUseCaseProtocol
    
    // MARK: - Init
    init(input: Input = .init()
         , output: Output = .init(),
         useCase: MoviesUseCaseProtocol) {
        self.input = input
        self.output = output
        self.useCase = useCase
    }
    
    // MARK: - Helper Funcstion
    
    func viewDidLoad() {
        loadMovies(sortedBy: .year)
    }
    
    func loadMovies(sortedBy: SortedTypes) {
        useCase.load(by: sortedBy)
            .map({MoviesDatasourcesViewModel(dataSources: $0)})
            .assign(to: &output.$itemViewModel)
    }
}
