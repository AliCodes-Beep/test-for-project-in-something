//
//  ExampleTableViewController.swift
//  Navigation Examples
//
//  Created by Bobby Sudekum on 12/18/17.
//  Copyright © 2017 Mapbox. All rights reserved.
//

import Foundation
import UIKit

let examples = ["Basic", "Waypoint Arrival Screen", "Custom Style"]

class ExampleTableViewController: UITableViewController {
    override func viewDidLoad() {
        self.clearsSelectionOnViewWillAppear = false
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExampleCell", for: indexPath)
        
        cell.textLabel?.text = examples[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TableToExampleSegue" {
            if let controller = segue.destination as? ExampleContainerViewController, let senderCell = sender as? UITableViewCell, let text = senderCell.textLabel?.text {
                controller.exampleToLoad = text
            }
        }
    }
}
