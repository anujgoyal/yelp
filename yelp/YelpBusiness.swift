//
//  YelpBusiness.swift
//  yelp
//
//  Created by Anuj Goyal on 10/4/14.
//  Copyright (c) 2014 TXT2LRN. All rights reserved.
//

import UIKit


class YelpBusiness {
    
    var dictionary: NSDictionary
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
    }
    
    var name: String {
        get {
            return self.dictionary["name"] as String
        }
    }
    
}