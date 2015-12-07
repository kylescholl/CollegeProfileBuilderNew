//
//  DetailViewController.swift
//  Contacts
//
//  Created by Kyle Scholl on 10/29/15.
//  Copyright © 2015 Patronus LLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var phoneNumberLabel: UILabel!
	
	var contact: Contact?
	
	
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		if let contact = self.contact {
			if let name: String = contact.name {
				self.nameLabel.text = name
			}
			if let phoneNumber: String = contact.phoneNumber {
				self.phoneNumberLabel.text = phoneNumber
			}
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
