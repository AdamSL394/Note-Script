//
//  AddNoteViewController.swift
//  Note-Script
//
//  Created by Adam Lehrer on 6/21/22.
//

import UIKit

class AddNoteViewController: UIViewController {
    
// MARK: -Initalization
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var note : Note?
    var update = false
    
    
    @IBAction func deleteClick(_ sender: Any) {
        APIFunctions.functions.deleteNote(id: note!._id)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveClick(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: Date())
        
        if update == true {
            APIFunctions.functions.updateNote(date: date, text: bodyTextView.text!, id: note!._id)
            self.navigationController?.popViewController(animated: true)
        }else if titleTextField.text != "" && bodyTextView.text != ""{
            APIFunctions.functions.AddNote(date: date, text: bodyTextView.text, userId: "112890888052131625129001")
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
// MARK: -Lifecycle Hook
    override func viewWillAppear(_ animated: Bool) {
        if update == false {
            self.deleteButton.isEnabled = false
            self.deleteButton.title = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if update == true {
            titleTextField.text = note!.date
            bodyTextView.text   = note!.text
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
