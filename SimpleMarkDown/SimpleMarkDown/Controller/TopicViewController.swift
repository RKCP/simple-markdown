//
//  ViewController.swift
//  SimpleMarkDown
//
//  Created by Raphael Peters on 16/02/2023.
//

import UIKit
import CoreData

class TopicViewController: UITableViewController {
    
    var topicArray = [Topic]() // Topic view should display all the possible topics. The topics are stored this array.
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //to access the CoreData methods in our App Delegate.
    
    var tempNoteTitle: String?
    var tempNoteParent: Topic?
    
    // note associated with this topic...
    var associatedNote: Note?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadTopics()
        
    }
    
//
//    //MARK: - Add Button Method
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {

        var textField = UITextField() // initialize a text field that the user can type into

        let alert = UIAlertController(title: "Add New Note Title", message: "", preferredStyle: .alert)

        let action = UIAlertAction(title: "Add Note", style: .default) { (action) in

            // set the details of the topic
            let newTopic = Topic(context: self.context)
            newTopic.name = textField.text! // create topic and set the title
            
            self.tempNoteTitle = textField.text!

            self.topicArray.append(newTopic) // add the new topic to the array of topics

            self.saveTopics()
            
            // create a note and link to topic....
            self.associatedNote = Note(context: self.context)
            self.associatedNote?.title = newTopic.name
            self.associatedNote?.parentTopic = newTopic
        }

        alert.addTextField { (alertTextField) in // add to the alert a text field, and its properties are going to be set in this alertTextField object

            alertTextField.placeholder = "Create a new note"
            textField = alertTextField // set this as the textfield before the user adds text
        }

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }



    //MARK: - TableView DataSource Methods
    // How many rows in the tableview (list of notes) to populate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicArray.count
    }


    // When we are at specific row, do XYZ
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let topic = topicArray[indexPath.row] // each single note in the array. this method automatically loops

        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) // add each category to the cell in the TableView

        cell.textLabel?.text = topic.name // set the cell as the tableName

        return cell
    }




//    //MARK: - Data Manipulation Methods
    func saveTopics() {

        do {
            try context.save()
        } catch {
            print("Error saving Topic: \(error)")
        }
        self.tableView.reloadData()
    }

    func loadTopics(with request: NSFetchRequest<Topic> = Topic.fetchRequest()) { // either take a request as a parameter or use the default new request

        do {
            topicArray = try context.fetch(request)
        } catch {
            print("Error fetching data (notes) from context: \(error)")
        }

        tableView.reloadData()
    }



    //MARK: - TableView Delegate Methods
    // what should happen when we click on one of the cells in the Category Table View

    // segue on click, and load the associated NotePage of that NoteList into the NotePage Screen Tableview

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.performSegue(withIdentifier: "goToNotePage", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }


    //MARK: - Segue Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            // usually use case here if many screen options.
            if (segue.identifier == "goToNotePage") {
                let destinationViewController = segue.destination as! NotePageViewController // specify the exact datatype the destination will be

                if let indexPath = tableView.indexPathForSelectedRow {
                    destinationViewController.selectedTopic = topicArray[indexPath.row] // the selectedNote we want to set is the note from the array in this class, with the index of whatever the user selects
                    destinationViewController.topicIndex = indexPath.row
                    destinationViewController.noteToDisplay = associatedNote
                }


            }
        }

}
