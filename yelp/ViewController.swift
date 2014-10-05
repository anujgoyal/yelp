//
//  ViewController.swift
//  yelp
//
//  Created by Anuj Goyal on 10/1/14.
//  Copyright (c) 2014 TXT2LRN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    // http://www.yelp.com/developers/get_access for keys
    var client: YelpClient!
    let yelpConsumerKey = "kuo-EJMFEqGwqVpx_PbI1A"
    let yelpConsumerSecret = "Qx8wmf5AefcfXb1c4ndjuF7GY0U"
    let yelpToken = "4VwRPj80JBwgpC-zEzrKAZtEV6wseIvx"
    let yelpTokenSecret = "-0Iib263aVt3y4NFY1VelLLCoJo"

    var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(false)
        
        // setup searchbar
        self.searchDisplayController?.displaysSearchBarInNavigationBar = true
        self.searchBar = UISearchBar()
        self.searchBar.delegate = self
        self.searchBar.placeholder = "e.g. thai, italian"
        self.navigationItem.titleView = self.searchBar
        
        // setup filter button
        var b = UIBarButtonItem(title: "Filters",
            style: UIBarButtonItemStyle.Bordered,
            target: self,
            action: Selector("goFilter"))
        self.navigationItem.leftBarButtonItem = b
        
        // setup navigation bar to be translucent
        //self.title = "Yelp"
        //var nav = self.navigationController?.navigationBar
        //nav?.barStyle = UIBarStyle.Black
        //self.navigationController?.navigationBar.translucent = false
        //nav?.tintColor = UIColor.whiteColor()
        //nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.redColor()]
        
        //        self.edgesForExtendedLayout = UIRectEdge.All
        //        self.extendedLayoutIncludesOpaqueBars = true
    }
    
    func goFilter() {
        NSLog("goFilter: ")
        let vc = FilterViewController()
        self.navigationController?.pushViewController(vc, animated: true )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup tableview stuff
        tableView.dataSource = self
        tableView.delegate = self

        // YelpClient should only be initialized once
        self.client = YelpClient(consumerKey: yelpConsumerKey,
            consumerSecret: yelpConsumerKey,
            accessToken: yelpToken,
            accessSecret: yelpTokenSecret)
        
        getData();
    }
    
    func getData() {
        NSLog("getData called")

        // try this out
        self.client.searchWithTerm("sushi", parameters: self.getSearchParameters(), offset: 0, limit: 20,
            success: {
                (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                
                var str = response as String
                
                println("response: \(str)")
                
                /* bruteforce way
                var bizArray = response["businesses"]
                
                
                // better way
                let currentArray = (response["businesses"] as Array).map({
                    (business: NSDictionary) -> YelpBusiness in
                    return YelpBusiness(dictionary: business)
                })*/
                
            },
            failure: {
                (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                
                println(error)
            })
    }
    
    func getSearchParameters() -> Dictionary<String, String> {
        // fill in location
        var params = [ "location" : "Seattle" ]

        /* fill in other search/filter params
        for (key, value) in ... {
            params[key] = value
        }
        */

        return params
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("YelpCell") as YelpCell
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
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
    Category list is here: http://www.yelp.com/developers/documentation/category_list

Clicking on the "Search" button should dismiss the filters page and trigger the search w/ the new filter settings.
Optional: Implement the restaurant detail page.
*/