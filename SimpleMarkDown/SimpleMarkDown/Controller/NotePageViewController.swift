//
//  NotePageViewController.swift
//  SimpleMarkDown
//
//  Created by Raphael Peters on 16/02/2023.
//

import UIKit
import CoreData

class NotePageViewController: UIViewController {
    
    @IBOutlet weak var textBox: UITextView!
    
    var selectedNote: Note? {
        didSet { // do the following once this category is set by the prepare method inside the CategoryViewController
            
            //loadItems()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: - Page View Methods
    
}

// -------------goals-------------
// pull up keyboard when note is loaded
// save note when user exits the text box/note screen
// make noteList title appear as title of this note
// link note to a list

extension NotePageViewController: UITextViewDelegate {
    
    
}
