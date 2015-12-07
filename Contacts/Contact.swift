//
//  Contacts.swift
//  Contacts
//
//  Created by Kyle Scholl on 10/29/15.
//  Copyright © 2015 Patronus LLC. All rights reserved.
//

import UIKit

class Contact: NSObject {
	
	var name : String?
	var phoneNumber : String?
	
	init (name: String? = nil, phoneNumber: String? = nil) {
		self.name = name
		self.phoneNumber = phoneNumber
		super.init()
	}
}
