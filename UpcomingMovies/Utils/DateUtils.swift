//
//  DateUtils.swift
//  UpcomingMovies
//
//  Created by Adriano Song on 28/09/2018.
//  Copyright © 2018 Adriano Song. All rights reserved.
//

import Foundation

class DateUtils {
    
    static func dateLocale(myDateString: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let myDate = dateFormatter.date(from: myDateString) {
            let dateLocaleFormatter = DateFormatter()
            dateLocaleFormatter.dateStyle = .medium
            dateLocaleFormatter.timeStyle = .none
            dateLocaleFormatter.locale = Locale(identifier: "en_US")
            return dateLocaleFormatter.string(from: myDate)
            
        } else {
            return ""
        }
    }
}
