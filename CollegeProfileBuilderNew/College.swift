//
//  College_NSObject.swift
//  College Profile Builder
//
//  Created by Kyle Scholl on 1/10/17.
//  Copyright © 2017 Patronus LLC. All rights reserved.
//

import UIKit

class Colleges: NSObject {
	var collegeArray = [Any]()
	var bool = true
	var name: String?
	var location: String?
	var population: String?
	var schoolImage: UIImage?
	init (name: String? = nil, location: String? = nil, population: String? = nil, schoolImage: UIImage? = nil) {
		self.name        = name
		self.location    = location
		self.population  = population
		self.schoolImage = schoolImage
		super.init()
	}
}
