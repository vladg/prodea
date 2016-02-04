//
//  DataModel.swift
//  Prodea-test
//
//  Created by Vladislav Glabai on 2/4/16.
//  Copyright © 2016 Vladislav Glabai. All rights reserved.
//

import Foundation

class DataModel {
	
	private var data: Array<String>?;
	
	func count() -> Int {
		return 1;
	}
	
	func getTitle(index: Int) -> String {
		return "title";
	}
	
	func refresh() {
		
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
			let url = NSURL(string: "http://jsonplaceholder.typicode.com/photos/")!;
			let data = NSData(contentsOfURL: url)!;
			let response = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions());
			let items = response as! Array<AnyObject>;
			var parsedData = Array<String>();
			for item in items {
				let title = (item as! NSDictionary)["title"] as! String;
				parsedData.append(title);
			}
			dispatch_async(dispatch_get_main_queue()) {
				self.onDataReceived(parsedData);
			}
		};
	}
	
	func onDataReceived(dataReceived: Array<String>) {
		self.data = dataReceived;
		print("%@", self.data);
	}
}

