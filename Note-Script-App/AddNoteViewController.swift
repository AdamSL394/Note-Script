//
//  AddNoteViewController.swift
//  Note-Script
//
//  Created by Adam Lehrer on 6/21/22.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    var note : Note?
    var update = false

    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var bodyTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    @IBAction func saveClick(_ sender: Any) {
        
        if update == true {
            APIFunctions.functions.updateNote(date: "Placeholder", text: bodyTextView.text!, id: note!._id)
        }else {
            APIFunctions.functions.AddNote(date: "Placeholder", text: bodyTextView.text, userId: "112890888052131625129001")
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if update == true {
            titleTextField.text = note!.date
            bodyTextView.text   = note!.text
        }
        // Do any additional setup after loading the view.
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
