//
//  DataModel.swift
//  Prodea-test
//
//  Created by Vladislav Glabai on 2/4/16.
//  Copyright © 2016 Vladislav Glabai. All rights reserved.
//

import Foundation

class DataModel {
	
	private var _data: Array<String>?;
	private var _delegate: DataModelDelegate?;
	
	init(delegate: DataModelDelegate?) {
		_delegate = delegate;
	}
	
	func count() -> Int {
		return _data?.count ?? 0;
	}
	
	func getTitle(index: Int) -> String {
		return _data?[index] ?? "";
	}
	
	func refresh() {
		
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
			// following code runs on a worker thread and does not block UI
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
				// this callback happens on the main thread and can update UI
				self.onDataReceived(parsedData);
			}
		};
	}
	
	func onDataReceived(dataReceived: Array<String>) {
		self._data = dataReceived;
		self._delegate?.onDataChanged();
	}
}

protocol DataModelDelegate {
	func onDataChanged();
}
