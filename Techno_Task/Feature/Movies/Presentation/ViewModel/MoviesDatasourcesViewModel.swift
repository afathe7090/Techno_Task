//
//  MoviesDatasourcesViewModel.swift
//  Techno_Task
//
//  Created by Ahmed Fathy on 05/02/2023.
//

import Foundation
import Combine
class MoviesDatasourcesViewModel {
    
    private let dataSources: [MoviesItem]
    
    // MARK: - Init
    init(dataSources: [MoviesItem]) {
        self.dataSources = dataSources
    }
    // MARK: - Helper function
    func numberOfRows() -> Int {
        return dataSources.count
    }
    func configureCell(_ cell: MoviesCell,for indexPath: IndexPath) {
        let data = dataSources[indexPath.row]
        cell.lblMovieName.text = data.title
        cell.lblMovieRate.text = "\(data.imDBRating ?? "")/10 IDMb"
        cell.lblMovieYear.text = data.year
        let urlImage = URL(string: data.image ?? "")!
        SessionImage.instance.download(from: urlImage) { response in
            switch response {
            case .success(let image):
                DispatchQueue.main.async { cell.imgMovie.image = image }
            case .failure(let error):
                print("Error loading image \(String(describing: error.errorDescription))")
            }
        }
    }
}
