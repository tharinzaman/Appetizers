//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Tharin Zaman on 05/01/2024.
//

import Foundation

extension Date {
    
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var twoHundredYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -200, to: Date())!
    }
}
