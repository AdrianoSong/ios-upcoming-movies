//
//  MovieTableViewCell.swift
//  UpcomingMovies
//
//  Created by Adriano Song on 28/09/2018.
//  Copyright © 2018 Adriano Song. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    //MARK: - Properties
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    //MARK: - UItableViewCell Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
