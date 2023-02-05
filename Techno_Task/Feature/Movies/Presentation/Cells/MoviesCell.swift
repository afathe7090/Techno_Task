//
//  MoviesCell.swift
//  Techno_Task
//
//  Created by Ahmed Fathy on 05/02/2023.
//

import UIKit

class MoviesCell: UITableViewCell {

    @IBOutlet weak var lblMovieRate: UILabel!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var lblMovieYear: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var viewYears: UIView!
    @IBOutlet weak var imgMovie: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    func configureUI() {
        [imgMovie, backView].forEach({
            $0?.layer.cornerRadius = 10
        })
        viewYears.layer.cornerRadius = 15
    }
    
}
