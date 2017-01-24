//
//  TableViewController.swift
//  College Profile Builder
//
//  Created by Kyle Scholl on 1/10/17.
//  Copyright © 2017 Patronus LLC. All rights reserved.
//

import UIKit

class CollegesTableViewController: UITableViewController {
	
	var collegeArray = [Colleges]()
	var colleges: [Colleges] = []
	var newCollege: Colleges!
	var theBool = false
	
	// MARK: - Table view data source
	override func numberOfSections(in tableView: UITableView) -> Int {
		// Return the number of sections.
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// Return the number of rows in the section.
		// ....................................... //
		//return self.colleges.count
		return self.collegeArray.count
	}
	
	// Sets the text of the tableViewCell
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		let college = self.collegeArray[indexPath.row]
		
		if let name = college.name, let location = college.location {
			cell.textLabel?.text = name
			cell.detailTextLabel?.text = location
		} else {
			cell.textLabel?.text = "No College to list"
			cell.detailTextLabel?.text = "No location to list"
		}
		return cell
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			collegeArray.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .fade)
			tableView.reloadData()
		}
	}
	
	override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		let collegeToMove = collegeArray[sourceIndexPath.row]
		collegeArray.remove(at: sourceIndexPath.row)
		collegeArray.insert(collegeToMove, at: destinationIndexPath.row)
		// ....................................... //
		//GlobalVariables.collegeArray.insert(collegeMoving, at: sourceIndexPath.row)
	}
	
	override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
		if tableView.isEditing {
			return .none
		} else {
			return .delete
		}
	}
	
	override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
		return false
	}
	
	func toggleEdit() {
		if theBool == true {
			navigationItem.rightBarButtonItem?.title = "Edit"
			print("0")
		} else {
			navigationItem.rightBarButtonItem?.title = "Done"
			print("1")
		}
		tableView.setEditing(!tableView.isEditing, animated: true)
		theBool = !theBool
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// ....................................................... //
		let destination = segue.destination as! DetailViewController
		let indexPath = self.tableView.indexPathForSelectedRow!
		destination.selectedCollege = collegeArray[indexPath.row]
	}
	
	func addCollege() {
		let alertController = UIAlertController(title: "Add New College", message: "A standard alert.", preferredStyle: .alert)
		let cancelAction    = UIAlertAction(title: "Cancel",  style: .cancel)  { action in }
		let confirmAction   = UIAlertAction(title: "Confirm", style: .default) { action in
			let nameTextField       = alertController.textFields![0] as UITextField
			let locationTextField   = alertController.textFields![1] as UITextField
			let populationTextField = alertController.textFields![2] as UITextField
			
			if nameTextField.text != "", locationTextField.text != "", populationTextField.text != "" {
				print("did it work")
				let newCollege = Colleges(name: nameTextField.text!, location: locationTextField.text, population: populationTextField.text, schoolImage: UIImage(named: "no_preview"))
				self.collegeArray.append(newCollege)
				self.tableView.reloadData()
				//TODO: Save user data in persistent storage - a tutorial for another time
			} else {
				//TODO: Add error handling
			}
			
			print("name: \(nameTextField.text), location: \(locationTextField.text), population \(populationTextField.text)")
		}
		
		alertController.addTextField { (textField : UITextField!) -> Void in
			textField.placeholder = "Enter college name"
		}
		alertController.addTextField { (textField : UITextField!) -> Void in
			textField.placeholder = "Enter college location"
		}
		alertController.addTextField { (textField : UITextField!) -> Void in
			textField.placeholder = "Enter college population"
		}
		
		alertController.addAction(cancelAction)
		alertController.addAction(confirmAction)
		
		self.present(alertController, animated: true, completion: nil)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		print("Launched")
		
		let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(CollegesTableViewController.addCollege))
		navigationItem.leftBarButtonItem = addButton
		
		let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(CollegesTableViewController.toggleEdit))
		navigationItem.setRightBarButton(editButton, animated: false)
		
		self.collegeArray.append(Colleges(
			name: "Drexel University",
			location: "Philadelphia, Pennsylvania",
			population: "26,359",
			schoolImage: UIImage(named: "Drexel")
		))
		self.collegeArray.append(Colleges(
			name: "James Madison University",
			location: "Harrisonburg, Virginia",
			population: "21,227",
			schoolImage: UIImage(named: "JMU")
		))
		self.collegeArray.append(Colleges(
			name: "Penn State University",
			location: "State College, Pennsylvania",
			population: "99,133",
			schoolImage: UIImage(named: "PSU")
		))
		self.collegeArray.append(Colleges(
			name: "University of Maryland",
			location: "College Park, Maryland",
			population: "38,140",
			schoolImage: UIImage(named: "UMD")
		))
		self.collegeArray.append(Colleges(
			name: "University Of Illinois",
			location: "Champaign, Illinois",
			population: "43,000",
			schoolImage: UIImage(named: "UIUC")
		))
		self.collegeArray.append(Colleges(
			name: "Clemson University",
			location: "Clemson, South Carolina",
			population: "23,406",
			schoolImage: UIImage(named: "Clemson")
		))
		self.collegeArray.append(Colleges(
			name: "University of Iowa",
			location: "Iowa City, Iowa",
			population: "31,000",
			schoolImage: UIImage(named: "Iowa")
		))
		self.collegeArray.append(Colleges(
			name: "Ohio State University",
			location: "Columbus, Ohio",
			population: "66,046",
			schoolImage: UIImage(named: "OSU")
		))
		self.collegeArray.append(Colleges(
			name: "University of Delaware",
			location: "Newark, Delaware",
			population: "22,680",
			schoolImage: UIImage(named: "UD")
		))
		self.collegeArray.append(Colleges(
			name: "Harvard University",
			location: "Cambridge, MA",
			population: "21,000",
			schoolImage: UIImage(named: "Harvard")
		))
	}
	
	override func viewWillAppear(_ animated: Bool) {
		self.tableView.reloadData()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}






