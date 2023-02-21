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
    
    var selectedNote = Note()
    
    var selectedTopic: Topic? {
        didSet { // do the following once this category is set by the prepare method inside the CategoryViewController
            
            //loadItems()
        }
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //to access the CoreData methods in our App Delegate.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadNote()
        
    }
    
    
    
    //MARK: - Load Data function
    func loadNote(with request: NSFetchRequest<Note> = Note.fetchRequest()) { // default is to create a new fetchRequest() but if we pass one, in the with external parameter, it will use that fetchRequest instead. (Such as the one used with the searchBar)
        
        do {
            selectedNote = try context.fetch(request)[0] // since the relationship is one to one, there should only be 1 selected note.
            // debug line above to see what is returned from the fetch. what is in the array?
        } catch {
            print("Error fetching data (note) from context: \(error)")
        }
    }
    
    
    //MARK: - Page View Methods
    
}

// -------------goals-------------
// when the user creates selects the add note button on the topic screen, it must createa a related note page (and segue to that note after it is created)

// save note when user exits the text box/note screen
// make topic title appear as title of this note
// link note to a list

extension NotePageViewController: UITextViewDelegate {
    
    
}
