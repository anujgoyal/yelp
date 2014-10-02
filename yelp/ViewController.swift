//
//  ViewController.swift
//  yelp
//
//  Created by Anuj Goyal on 10/1/14.
//  Copyright (c) 2014 TXT2LRN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var client: YelpClient!
    
    // http://www.yelp.com/developers/get_access for keys
    let yelpConsumerKey = "kuo-EJMFEqGwqVpx_PbI1A"
    let yelpConsumerSecret = "Qx8wmf5AefcfXb1c4ndjuF7GY0U"
    let yelpToken = "4VwRPj80JBwgpC-zEzrKAZtEV6wseIvx"
    let yelpTokenSecret = "-0Iib263aVt3y4NFY1VelLLCoJo"
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    
    
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

/*

Search results page
    Table rows should be dynamic height according to the content height
    Custom cells should have the proper Auto Layout constraints
    Search bar should be in the navigation bar (doesn't have to expand to show location like the real Yelp app does).
    Optional: infinite scroll for restaurant results
    Optional: Implement map view of restaurant results

Filter page. Unfortunately, not all the filters are supported in the Yelp API.
    The filters you should actually have are: category, sort (best match, distance, highest rated), radius (meters), deals (on/off).
    The filters table should be organized into sections as in the mock.
    You can use the default UISwitch for on/off states. Optional: implement a custom switch
    Radius filter should expand as in the real Yelp app
    Categories should show a subset of the full list with a "See All" row to expand.
    Category list is here: http://www.yelp.com/developers/documentation/category_list (Links to an external site.)

Clicking on the "Search" button should dismiss the filters page and trigger the search w/ the new filter settings.
Optional: Implement the restaurant detail page.
*/