//
//  ViewController.swift
//  Prodea-test
//
//  Created by Vladislav Glabai on 2/4/16.
//  Copyright © 2016 Vladislav Glabai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DataModelDelegate {
	
	@IBOutlet var tableView: UITableView!;
	
	var model: DataModel!;
	
	

	override func viewDidLoad() {
		super.viewDidLoad()
		model = DataModel(delegate: self);
		model.refresh();
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	//
	// UITableViewDataSource
	//

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return model.count();
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell_id = "prodea-test-cell";
		let cell = tableView.dequeueReusableCellWithIdentifier(cell_id)!;
		cell.textLabel?.text = model.getTitle(indexPath.row);
		return cell;
		
	}

	//
	// DataModelDelegate
	//
	func onDataChanged() {
		self.tableView.reloadData();
	}
}

