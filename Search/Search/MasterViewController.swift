//
//  MasterViewController.swift
//  Search
//
//  Created by Mac Bellingrath on 1/22/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, UISearchResultsUpdating, UISearchControllerDelegate{

    var detailViewController: DetailViewController? = nil
    var resultSearchController: UISearchController!
    var originalStates = ["Alabama", "California", "Tennessee","New York","Texas", "Florida","Illinois"]
    var filteredStates = [String]()

    enum ScopeButtonTitleType: String {
         case East, West
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        tableView.backgroundColor = UIColor.whiteColor()
        
        resultSearchController = UISearchController(searchResultsController: nil)
        
        resultSearchController.searchResultsUpdater = self
        resultSearchController.dimsBackgroundDuringPresentation = false
        let b = resultSearchController.searchBar
        b.sizeToFit()
        b.autocapitalizationType = .None
        b.scopeButtonTitles = [ScopeButtonTitleType.East.rawValue, ScopeButtonTitleType.West.rawValue]
        tableView.tableHeaderView = b
        resultSearchController.delegate = self
        tableView.setContentOffset(CGPoint(x: 0, y: resultSearchController.searchBar.frame.height), animated: false)
        
       
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        }
   
    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return resultSearchController.active ?   filteredStates.count : originalStates.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

  
        cell.textLabel?.text = resultSearchController.active ? filteredStates[indexPath.row] : originalStates[indexPath.row]
        return cell
    }

       func updateSearchResultsForSearchController(searchController: UISearchController) {
        guard let text = searchController.searchBar.text  where text.characters.count > 0 else {  filteredStates.removeAll(); filteredStates = originalStates; tableView.reloadData(); return }
        
        switch searchController.searchBar.selectedScopeButtonIndex {
        case 0: filteredStates = ["Tennessee","Florida","New York"]
        case 1: filteredStates = originalStates.filter {
            let found = $0.rangeOfString(text, options: .CaseInsensitiveSearch)
            return found != nil
            }

        
        default: break
        }
               tableView.reloadData()
        
    }
    func willPresentSearchController(searchController: UISearchController) {
        
    }
    
    func willDismissSearchController(searchController: UISearchController) {
        
    }


}

