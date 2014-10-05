//
//  FilterViewController.swift
//  yelp
//
//  Created by Anuj Goyal on 10/4/14.
//  Copyright (c) 2014 TXT2LRN. All rights reserved.
//

import Foundation

class FilterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    var headerArray = ["category", "radius", "food", "rating"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup tableview stuff
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //static var cellIdentifier: String = "cell"
        //var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        // http://www.idev101.com/code/User_Interface/UITableView/customizing.html
        let cell = UITableViewCell()
        
        // custom label
        var label = UILabel(frame: CGRect(x: 20.0, y: 8.0, width: 300.0, height: 30.0))
        cell.contentView.addSubview(label)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    // setting up sections (min 35-40)
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return headerArray.count
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        headerView.backgroundColor = UIColor(white: 0.8, alpha: 0.8)
        var headerLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 320, height: 50))
        headerLabel.text = headerArray[section]
        headerView.addSubview(headerLabel)
        return headerView
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
