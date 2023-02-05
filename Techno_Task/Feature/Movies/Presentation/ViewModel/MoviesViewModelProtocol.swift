//
//  MoviesViewModelProtocol.swift
//  Techno_Task
//
//  Created by Ahmed Fathy on 05/02/2023.
//

import Foundation

protocol MoviesViewModelProtocol: AnyObject {
    var input: MoviesViewModel.Input { get }
    var output: MoviesViewModel.Output { get }
    
    func viewDidLoad()
    func loadMovies(sortedBy: SortedTypes)
}
