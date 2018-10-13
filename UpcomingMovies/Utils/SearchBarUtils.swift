//
//  SearchBarUtils.swift
//  UpcomingMovies
//
//  Created by Adriano Song on 29/09/2018.
//  Copyright © 2018 Adriano Song. All rights reserved.
//

import Foundation
import UIKit

class SearchBarUtils {
    
    static func isSearchBarEmpty(searchNavigationController: UISearchController) -> Bool{
        return searchNavigationController.searchBar.text?.isEmpty ?? true
    }
    
    static func isSearchBarPerfomingFilter(searchNavigationController: UISearchController) -> Bool {
        return searchNavigationController.isActive && !isSearchBarEmpty(searchNavigationController: searchNavigationController)
    }
}
