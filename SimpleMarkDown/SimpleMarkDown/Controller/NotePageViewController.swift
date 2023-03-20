//
//  NotePageViewController.swift
//  SimpleMarkDown
//
//  Created by Raphael Peters on 16/02/2023.
//

import UIKit
import CoreData

class NotePageViewController: UIViewController{
    
    @IBOutlet weak var textBox: UITextView!
    @IBOutlet weak var navBarTitle: UINavigationItem!
    
    var topicIndex: Int?
    
    var selectedTopic: Topic?
    
    var noteToDisplay: Note?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //to access the CoreData methods in our App Delegate.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // call method to create and load associated note here, because the view has loaded, but has not 'appeared' yet. (viewDidAppear)
        
        let request = fetchNote()
        loadAssociatedNote(with: request)
        
        navBarTitle.title = noteToDisplay?.title
        textBox.text = noteToDisplay?.text
        self.textBox.delegate = self // need to set the delegate for the textBox outlet created above or the delegate methods won't work.
    }
    
    
    
    //MARK: - Load and Create associated note function
    func loadAssociatedNote(with request: NSFetchRequest<Note> = Note.fetchRequest()) { // default is to create a new fetchRequest() but if we pass one, in the with external parameter, it will use that fetchRequest instead. (Such as the one used with the searchBar)

        let topicPredicate = NSPredicate(format: "parentTopic.name MATCHES %@", selectedTopic!.name!)
        
        request.predicate = topicPredicate
        
        do {
            noteToDisplay = try context.fetch(request)[0]
        } catch {
            print("Error fetching data (note) from context: \(error)")
        }
        
//        let newNote = Note(context: self.context)
//        newNote.title = selectedTopic?.name
//        newNote.parentTopic = self.selectedTopic
//        noteToDisplay = newNote
    }
    
    //MARK: - Save Note
    
    func saveNote() {
        
        do {
            try context.save()
        } catch {
            print("Error saving note: \(error)")
        }
    }
    
    //MARK: - Fetch Note
    
    func fetchNote() -> NSFetchRequest<Note> {
        
        let request: NSFetchRequest<Note> = Note.fetchRequest()
        
        let titleToSearch = selectedTopic!.name!
        
        request.predicate = NSPredicate(format: "title CONTAINS[cd] %@", titleToSearch)
        
        return request
    }

}

//MARK: - UITextView Delegate Methods (optional)
extension NotePageViewController: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
            print("exampleTextView: BEGIN EDIT")
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        textBox.resignFirstResponder()
        saveNote()
    }
}




// -------------goals-------------

// save note when user:
//      1. exits the note screen
//      2. exits the text box itself (aka finishes editing)

// link note to a list


// currently we are creating a new note each time we load a note, instead of loading an existing one... Need to fix this.
