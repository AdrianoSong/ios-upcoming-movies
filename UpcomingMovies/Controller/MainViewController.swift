//
//  ViewController.swift
//  UpcomingMovies
//
//  Created by Adriano Song on 27/09/2018.
//  Copyright © 2018 Adriano Song. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {

    //MARK: - Properties
    
    @IBOutlet weak var moviesTableView: UITableView!
    @IBOutlet weak var activityLoading: UIActivityIndicatorView!
    
    fileprivate var page = 1
    fileprivate var mainPresenter = MainPresenter()
    
    let searchNavigationController = UISearchController(searchResultsController: nil)
    
    //MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        mainPresenter.fetchMovies(page: page) {
            
            DispatchQueue.main.async {
                
                self.showOrHideActivityLoading(hidden: true)
                self.setupTableView()
            }
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        self.moviesTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Internal funcs
    
    fileprivate func setupTableView() {
        
        self.moviesTableView.delegate = self
        self.moviesTableView.dataSource = self
        self.moviesTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieCell")
        self.moviesTableView.isHidden = false
        self.moviesTableView.reloadData()
    }
    
    fileprivate func setupNavigationBar(){
        
        searchNavigationController.searchResultsUpdater = self
        searchNavigationController.obscuresBackgroundDuringPresentation = false
        searchNavigationController.searchBar.placeholder = "Search Movies"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchNavigationController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    fileprivate func showOrHideActivityLoading(hidden: Bool){
        activityLoading.isHidden = hidden
    }
    
    fileprivate func performMoviePagination() {
        
        if !mainPresenter.fetchMoreMovies {
            showOrHideActivityLoading(hidden: false)
            mainPresenter.fetchMoreMovies = true
            page += 1
            mainPresenter.fetchMovies(page: page) {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                    
                    self.showOrHideActivityLoading(hidden: true)
                    self.mainPresenter.fetchMoreMovies = false
                    self.moviesTableView.reloadData()
                })
            }
        }
    }
    
    //MARK: - SearchBar Delegates
    
    func updateSearchResults(for searchController: UISearchController) {
        
        mainPresenter.filterSearchedMovies(userText: searchController.searchBar.text) {
            
            self.moviesTableView.reloadData()
        }
    }
    
    //MARK: - TableView protocols implementation
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if SearchBarUtils.isSearchBarPerfomingFilter(searchNavigationController: searchNavigationController) {
            return mainPresenter.searchedMovies.count
        } else {
            return mainPresenter.movieViewModel.count
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var movie: MovieViewModel?
        
        if SearchBarUtils.isSearchBarEmpty(searchNavigationController: searchNavigationController) {
            movie = mainPresenter.movieViewModel[indexPath.row]
        } else {
            movie = mainPresenter.searchedMovies[indexPath.row]
        }
        
        let movieDetailVC = MovieDetailViewController()
        movieDetailVC.myMovie = movie

        searchNavigationController.searchBar.text = ""
        
        self.navigationController?.pushViewController(movieDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movieCell = Bundle.main.loadNibNamed("MovieTableViewCell", owner: self, options: nil)?.first as! MovieTableViewCell
        
        let movie = mainPresenter.getMovieSearchedOrNot(indexPath: indexPath, searchNavigationController: searchNavigationController)
        
        movieCell.movieTitle.text = movie?.movieTitle ?? ""
        movieCell.releaseDate.text = movie?.movieReleaseDate ?? ""
        
        if let moviePosterPath = movie?.moviePosterPath {
            
            MyHTTPRequester.getImageFromWeb(stringURL: Constants.BASE_IMG_URL + moviePosterPath, imageScale: 1.5) { (myImage) in
                
                DispatchQueue.main.async {
                    movieCell.moviePoster.image = myImage
                }
            }
        }
        return movieCell
    }
    
    //MARK: - ScrollView Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offSetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offSetY > (contentHeight - scrollView.frame.height) {
            
            performMoviePagination()
        }
    }
}

