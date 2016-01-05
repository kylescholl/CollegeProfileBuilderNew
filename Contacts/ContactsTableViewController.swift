//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Kyle Scholl on 10/26/15.
//  Copyright © 2015 Patronus LLC. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
	
	var contacts: [Contact] = []
	
    // MARK: - Table view data source
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		// Return the number of sections.
		return 1
	}
	
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// Return the number of rows in the section.
		return self.contacts.count
	}
	
	
	// Sets the text of the tableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
		
		let contact = self.contacts[indexPath.row]
		
		if let name = contact.name {
			cell.textLabel?.text = name
		} else {
			cell.textLabel?.text = "No Name"
		}
		
		return cell
    }
	

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
	
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if editingStyle == .Delete {
			self.contacts.removeAtIndex(indexPath.row)
			tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
		}
	}
	
	
	override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
		let contactMoving = contacts.removeAtIndex(sourceIndexPath.row)
		contacts.insert(contactMoving, atIndex: destinationIndexPath.row)
	}
	
	
	override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
		if tableView.editing {
			return .None
		} else {
			return .Delete
		}
	}
	
	override func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
		return false
	}
	
	
	func toggleEdit() {
		tableView.setEditing(!tableView.editing, animated: true)
		//navigationItem.leftBarButtonItem =
		//self.navigationItem.leftBarButtonItem?.title = "Done"
	}
	
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell)!
		let contact = self.contacts[indexPath.row]
		
		let destination = segue.destinationViewController as! DetailViewController
		destination.contact = contact
	}
	
	func addContact() {
		let newContact = Contact(name: "New Contact")
		self.contacts.append(newContact)
		let newIndexPath = NSIndexPath(forRow: self.contacts.count - 1, inSection: 0)
		self.tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: Selector("addContact"))
		navigationItem.rightBarButtonItem = addButton
		
		let moveButton = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: Selector("toggleEdit"))
		navigationItem.leftBarButtonItem = moveButton
		
		let jenny = Contact(phoneNumber: "867-5309")
		let rich = Contact(name: "Rich", phoneNumber: "888-888-8888")
		let mindy = Contact(name: "Mindy")
		let kyle = Contact(name: "Kyle", phoneNumber: "267-319-3050")
		let zane = Contact(name: "Zane", phoneNumber: "443-995-5205")
		
		self.contacts.append(jenny)
		self.contacts.append(rich)
		self.contacts.append(mindy)
		self.contacts.append(kyle)
		self.contacts.append(zane)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
