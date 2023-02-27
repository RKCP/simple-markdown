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
    @IBOutlet weak var navBarTitle: UINavigationItem!
    
    var topicIndex: Int?
    
    var selectedTopic: Topic?
    
    var noteToDisplay: Note?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //to access the CoreData methods in our App Delegate.
    // set the details of the created new note that we will pass to the NotePageViewController
//    destinationViewController.newNote.title = tempNoteTitle
//    destinationViewController.newNote.text = ""
//                    destinationViewController.newNote.parentTopic =
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loadAssociatedNote()
        
        navBarTitle.title = "newNote.title!"
        textBox.text = noteToDisplay?.text
    }
    
    
    
    //MARK: - Load Data function
//    func loadAssociatedNote(with request: NSFetchRequest<Note> = Note.fetchRequest()) { // default is to create a new fetchRequest() but if we pass one, in the with external parameter, it will use that fetchRequest instead. (Such as the one used with the searchBar)
//
//        do {
//            newNote = try context.fetch(request)[topicIndex!]
//            // since the relationship is one to one, there should only be 1 selected note.
//            // debug line above to see what is returned from the fetch. what is in the array?
//            print("asdasd")
//        } catch {
//            print("Error fetching data (note) from context: \(error)")
//        }
//    }

    
    //MARK: - Page View Methods
    
}

// -------------goals-------------
// when the user creates selects the add note button on the topic screen, it must createa a related note page (and segue to that note after it is created)
// first lets update the title on the nav bar of a created note page to see if it is linked to the correct Topic.

// save note when user exits the text box/note screen
// make topic title appear as title of this note
// link note to a list

extension NotePageViewController: UITextViewDelegate {
    
    
}
