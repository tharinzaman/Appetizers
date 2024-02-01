//
//  UITestingHelper.swift
//  Appetizers
//
//  Created by Tharin Zaman on 30/01/2024.
//

#if DEBUG

import Foundation

struct UITestingHelper {
    
    static var isUITest: Bool {
        ProcessInfo.processInfo.arguments.contains("-ui-testing")
    }
    
    static var networkingSuccess: Bool {
        ProcessInfo.processInfo.environment["-networking-success"] == "1"
    }
    
}

#endif
