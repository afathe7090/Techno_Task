//
//  MoviesFactoy.swift
//  Techno_Task
//
//  Created by Ahmed Fathy on 05/02/2023.
//

import UIKit
extension Factory {
    static func moviesFactory() -> UIViewController {
        let remoteRepo: MoviesRepoRemoteProtocol = MoviesRepoRemoteImple()
        let repo: MoviesRepositoryProrocol = MoviesRepositoryImple(remote: remoteRepo)
        let useCase: MoviesUseCaseProtocol = MoviesUseCase(repo: repo)
        let viewModel: MoviesViewModelProtocol = MoviesViewModel(useCase: useCase)
        let viewController = MoviesVIewController(viewModel: viewModel)
        return viewController
    }
}
