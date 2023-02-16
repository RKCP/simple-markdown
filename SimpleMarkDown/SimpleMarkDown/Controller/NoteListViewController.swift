//
//  ViewController.swift
//  SimpleMarkDown
//
//  Created by Raphael Peters on 16/02/2023.
//

import UIKit
import CoreData

class NoteListViewController: UITableViewController {
    
    var notePagesArray = [Note]() // note list view should display all the possible notes. these notes are stored this array.
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //to access the CoreData methods in our App Delegate.
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

