//
//  String+Ext.swift
//  Appetizers
//
//  Created by Tharin Zaman on 20/12/2023.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailFormat         = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate      = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)

//        let emailRegex = Regex {
//            OneOrMore {
//                CharacterClass(
//                    .anyOf("._%+-"),
//                    ("A"..."Z"),
//                    ("0"..."9"),
//                    ("a"..."z")
//                )
//            }
//            "@"
//            OneOrMore {
//                CharacterClass(
//                    .anyOf("-"),
//                    ("A"..."Z"),
//                    ("a"..."z"),
//                    ("0"..."9")
//                )
//            }
//            "."
//            Repeat(2...64) {
//                CharacterClass(
//                    ("A"..."Z"),
//                    ("a"..."z")
//                )
//            }
//        }
//
//        return self.wholeMatch(of: emailRegex) !=  nil
    }
}
