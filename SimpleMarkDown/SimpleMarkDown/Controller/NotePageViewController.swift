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
    
    var selectedTopic: Topic?
    
    var noteToDisplay: Note?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //to access the CoreData methods in our App Delegate.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // call method to create and load associated note here, because the view has loaded, but has not 'appeared' yet. (viewDidAppear)
        
        let request = fetchNote() // build a NSFetchRequest based on the selectedTopic title, fetching a Note with the same title as the selectedTopic title
        loadAssociatedNote(with: request) // pass that request to the loadAssociatedNote method and load a note if there is one. This request will be nil if it is a new topic/note.
        
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
    }
    
    //MARK: - Save Note
    
    func saveTextViewContents() {
        noteToDisplay!.text = textBox.text
        // Add any other code you need to store the note.
    }
    
    func saveNote() {
        
        do {
            try context.save()
            print("Note Saved!")
        } catch {
            print("Error saving note: \(error)")
        }
    }
    
    //MARK: - Fetch Note
    
    func fetchNote() -> NSFetchRequest<Note> {
        
        let request: NSFetchRequest<Note> = Note.fetchRequest()
        
        let titleToSearch = selectedTopic!.name!
        
        request.predicate = NSPredicate(format: "title CONTAINS[cd] %@", titleToSearch) // query based on the topic name
        
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
        saveTextViewContents()
        saveNote()
    }
}

// always send a new note or a nil note from topic controller segue to here.
// need a way to cancel adding note
