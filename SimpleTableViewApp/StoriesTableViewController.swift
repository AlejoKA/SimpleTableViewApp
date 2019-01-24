//
//  StoriesTableViewController.swift
//  SimpleTableViewApp
//
//  Created by Aleksey Kapranov on 24/01/2019.
//  Copyright © 2019 Alejo_KA. All rights reserved.
//

import UIKit

struct Headline {
    
    var id : Int
    var title : String
    var text : String
    var image : String
    
}

class StoriesTableViewController: UITableViewController {
    
    var headlines = [
        Headline(id: 1, title: "Lorem Ipsum", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", image: "Apple"),
        Headline(id: 2, title: "Aenean condimentum", text: "Ut eget massa erat. Morbi mauris diam, vulputate at luctus non.", image: "Banana"),
        Headline(id: 3, title: "In ac ante sapien", text: "Aliquam egestas ultricies dapibus. Nam molestie nunc.", image: "Cantaloupe"),
        ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlines.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        let headline = headlines[indexPath.row]
        cell.textLabel?.text = headline.title
        cell.detailTextLabel?.text = headline.text
        cell.imageView?.image = UIImage(named: headline.image)
        
        return cell
    }
    
    
    // Enabling the edit mode(self.tableView.isEditing = true) causes delete buttons to be visible for all cells
    // Disable the buttons by implementing these methods:
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
    // Reordering control to move cells. Elements in the underlying data list are updated.
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.headlines[sourceIndexPath.row]
        headlines.remove(at: sourceIndexPath.row)
        headlines.insert(movedObject, at: destinationIndexPath.row)
    }
    
}
