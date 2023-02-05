//
//  MoviesDatasources.swift
//  Techno_Task
//
//  Created by Ahmed Fathy on 05/02/2023.
//

import UIKit

class MoviesDatasources: NSObject , UITableViewDelegate, UITableViewDataSource {
    
    private let viewModel: MoviesDatasourcesViewModel
    
    // MARK: - Init
    init(viewModel: MoviesDatasourcesViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Delegate Implementation
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesCell", for: indexPath) as! MoviesCell
        viewModel.configureCell(cell, for: indexPath)
        return cell
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}

