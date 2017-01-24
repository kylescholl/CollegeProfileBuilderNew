//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by Kyle Scholl on 1/10/17.
//  Copyright © 2017 Patronus LLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	
	@IBOutlet var locationLabel:       UILabel!
	@IBOutlet var populationLabel:     UILabel!
	
	@IBOutlet var schoolTextField:     UITextField!
	@IBOutlet var locationTextField:   UITextField!
	@IBOutlet var populationTextField: UITextField!
	
	@IBOutlet var logoImageView:       UIImageView!
	
	var editBool = false
	var selectedCollege: Colleges!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(DetailViewController.edit))
		navigationItem.setRightBarButton(editButton, animated: false)
		
		if let college = self.selectedCollege {
			if let name: String = college.name {
				self.schoolTextField.text = name
				navigationItem.title  = name
			}
			if let location: String = college.location {
				self.locationLabel.text = "Location"
				self.locationTextField.text = location
			}
			if let population: String = college.population {
				self.populationLabel.text = "School Population"
				self.populationTextField.text = population
			}
			if let schoolImage: UIImage = college.schoolImage {
				self.logoImageView.image = schoolImage
			}
		}
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		selectedCollege.name       = schoolTextField.text!
		selectedCollege.location   = locationTextField.text!
		selectedCollege.population = populationTextField.text!
		textField.resignFirstResponder()
		return true
	}
	
	func edit() {
		if editBool == true {
			navigationItem.rightBarButtonItem?.title = "Done"
			print("editting")
		} else {
			navigationItem.rightBarButtonItem?.title = "Edit"
			print("not editting")
		}
		editBool = !editBool
	}
}
