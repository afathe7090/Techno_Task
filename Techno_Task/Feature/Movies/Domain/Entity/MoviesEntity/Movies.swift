//
//  Movies.swift
//  Techno_Task
//
//  Created by Ahmed Fathy on 05/02/2023.
//

import Foundation

// MARK: - TopMovie
struct Movies: Codable {
    let items: [MoviesItem]?
    let errorMessage: String?
}

// MARK: - Item
struct MoviesItem: Codable {
    let id, rank, title, fullTitle: String?
    let year: String?
    let image: String?
    let crew, imDBRating, imDBRatingCount: String?

    enum CodingKeys: String, CodingKey {
        case id, rank, title, fullTitle, year, image, crew
        case imDBRating = "imDbRating"
        case imDBRatingCount = "imDbRatingCount"
    }
}

