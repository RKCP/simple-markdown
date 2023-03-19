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
        
        // call method to create and load associated note here, because the view has loaded, but has not 'appeared' yet. (viewDidAppear)
        
        loadAssociatedNote()
        
        navBarTitle.title = noteToDisplay?.title
        textBox.text = noteToDisplay?.text
    }
    
    
    
    //MARK: - Load and Create associated note function
    func loadAssociatedNote(with request: NSFetchRequest<Note> = Note.fetchRequest()) { // default is to create a new fetchRequest() but if we pass one, in the with external parameter, it will use that fetchRequest instead. (Such as the one used with the searchBar)

        
        let newNote = Note(context: self.context)
        newNote.title = selectedTopic?.name
        newNote.parentTopic = self.selectedTopic
        noteToDisplay = newNote
        
//        do {
//            // for now just createa a new note. not loading a note.
////            newNote = try context.fetch(request)[topicIndex!]
//
//
//
//            // since the relationship is one to one, there should only be 1 selected note.
//            // debug line above to see what is returned from the fetch. what is in the array?
//            print("asdasd")
//        } catch {
//            print("Error fetching data (note) from context: \(error)")
//        }
    }
    
    //MARK: - Save Note
    
    func saveNote() {
        
        do {
            try context.save()
        } catch {
            print("Error saving note: \(error)")
        }
    }
    

    
    //MARK: - Methods to call save func
    
    
    
}

// -------------goals-------------

// save note when user:
//      1. exits the note screen
//      2. exits the text box itself (aka finishes editing)

// link note to a list

extension NotePageViewController: UITextViewDelegate {
    
    
}
