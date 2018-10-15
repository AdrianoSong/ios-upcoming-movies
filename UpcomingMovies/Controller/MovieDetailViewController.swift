//
//  MovieDetailViewController.swift
//  UpcomingMovies
//
//  Created by Adriano Song on 28/09/2018.
//  Copyright © 2018 Adriano Song. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var labelReleaseDate: UILabel!
    @IBOutlet weak var labelOriginalTitle: UILabel!
    @IBOutlet weak var labelGenre: UILabel!
    @IBOutlet weak var labelOverview: UILabel!
    @IBOutlet weak var activityLoading: UIActivityIndicatorView!
    @IBOutlet weak var mainStack: UIStackView!
    
    var myMovie: MovieViewModel?
    var movieDetail: MovieDetailViewModel?
    
    var movieDetailPresenter: MovieDetailPresenter?

    //MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dismiss(animated: true, completion: nil)
        
        movieDetailPresenter = MovieDetailPresenter()
        
        movieDetailPresenter?.callMovieDetail(myMovie: myMovie) { movieDetailVM in
            
            self.movieDetail = movieDetailVM

            DispatchQueue.main.async { [weak self] in
            
                self?.setupViewController()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func setupViewController(){
        
        title = myMovie?.movieTitle
        
        activityLoading.isHidden = true
        mainStack.isHidden = false
        
        labelGenre.text = "Genre: \(movieDetail?.movieGenreArray ?? "")"
        labelReleaseDate.text = "Release date: \(movieDetail?.movieReleaseDate ?? "")"
        labelOriginalTitle.text = movieDetail?.movieOriginaltitle ?? ""
        labelOverview.text = movieDetail?.movieOverView ?? ""

        guard let posterStringURL = myMovie?.moviePosterPath else {
            return
        }

        MyHTTPRequester.getImageFromWeb(stringURL: Constants.BASE_IMG_URL + posterStringURL, imageScale: 2.5) { (myImage) in

            DispatchQueue.main.async { [weak self] in
                self?.imagePoster.image = myImage
            }
        }
    }
}
