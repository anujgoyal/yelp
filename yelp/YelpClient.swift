//
//  YelpClient.swift
//  Yelp
//
//  Created by Timothy Lee on 9/19/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class YelpClient: BDBOAuth1RequestOperationManager {
    var accessToken: String!
    var accessSecret: String!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(consumerKey key: String!, consumerSecret secret: String!, accessToken: String!, accessSecret: String!) {
        self.accessToken = accessToken
        self.accessSecret = accessSecret
        var baseUrl = NSURL(string: "http://api.yelp.com/v2/")
        super.init(baseURL: baseUrl, consumerKey: key, consumerSecret: secret);
        
        var token = BDBOAuthToken(token: accessToken, secret: accessSecret, expiration: nil)
        self.requestSerializer.saveAccessToken(token)
    }
    
    // term is the search term being used e.g. "mexican" or "thai"
    // offset is the offset into the # of records (useful for infinte scrolling?)
    // limit is the limit of records
    func searchWithTerm(term: String, parameters: Dictionary<String, String>? = nil, offset: Int = 0, limit: Int = 20,
        success: (AFHTTPRequestOperation!, AnyObject!) -> Void,
        failure: (AFHTTPRequestOperation!, NSError!) -> Void) -> AFHTTPRequestOperation! {
        // For additional parameters, see http://www.yelp.com/developers/documentation/v2/search_api
        
        // setup initial params
        var params: NSMutableDictionary = [ "term": term, "offset": offset, "limit": limit]

        // add other params that were passed in
        for (key, value) in parameters! {
            params.setValue(value, forKey: key)
        }
            
        // pass in params, success, failure;   success & failure are closures that are passed through
        return self.GET("search", parameters: params, success: success, failure: failure)
    }
    
}