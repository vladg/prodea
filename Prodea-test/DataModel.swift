//
//  DataModel.swift
//  Prodea-test
//
//  Created by Vladislav Glabai on 2/4/16.
//  Copyright © 2016 Vladislav Glabai. All rights reserved.
//

import Foundation

class DataModel : NSObject, NSURLConnectionDataDelegate {
	
	var data: Array<String>?;
	
	func count() -> Int {
		return 1;
	}
	
	func getTitle(index: Int) -> String {
		return "title";
	}
	
	func refresh() {
		let request = NSURLRequest(URL: NSURL(string: "http://jsonplaceholder.typicode.com/photos/")!);
		
		// create the connection with the request
		// and start loading the data
		let connection = NSURLConnection(request: request, delegate: self, startImmediately: true);
	}
	
	//
	// connection delegate
	//
	
	func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
		
	}
	
	func connection(connection: NSURLConnection, didReceiveData data: NSData) {
		
	}
}