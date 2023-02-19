//
//  NotePageViewController.swift
//  SimpleMarkDown
//
//  Created by Raphael Peters on 16/02/2023.
//

import UIKit
import CoreData

class NotePageViewController: UITableViewController {
    
    var selectedNote: Note? {
        didSet { // do the following once this category is set by the prepare method inside the CategoryViewController
            
            //loadItems()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
