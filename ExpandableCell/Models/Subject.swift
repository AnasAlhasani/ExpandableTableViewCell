//
//  Subject.swift
//  ExpandableCell
//
//  Created by Anas Alhasani on 10/8/17.
//  Copyright © 2017 Anas Alhasani. All rights reserved.
//

import Foundation

class Subject {
    
    let title: String
    let description: String
    var isExpanded: Bool
    
    private init(title: String, description: String) {
        self.title = title
        self.description = description
        self.isExpanded = false
    }
    
    private convenience init?(dictionary: [String: String]) {
        guard let title = dictionary["Title"],
            let description = dictionary["Description"] else {
                return nil
        }
        
        self.init(title: title, description: description)
    }
    
    static func allSubjects() -> [Subject] {
        var subjects = [Subject]()
        
        guard let URL = Bundle.main.url(forResource: "Subjects", withExtension: "plist"),
            let subjectsFromPlist = NSArray(contentsOf: URL) as? [[String:String]] else {
                return subjects
        }
        
        for dictionary in subjectsFromPlist {
            if let subject = Subject(dictionary: dictionary) {
                subjects.append(subject)
            }
        }
        
        return subjects
    }
}
