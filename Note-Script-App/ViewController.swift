//
//  ViewController.swift
//  Note-Script
//
//  Created by Adam Lehrer on 6/20/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var notesTableView: UITableView!
    var notesArray = [Note]()
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc  = segue.destination as! AddNoteViewController
        
        if segue.identifier == "updateNoteSegue" {
            vc.note = notesArray[notesTableView.indexPathForSelectedRow!.row]
            vc.update = true
        }
        
    }
    
    
    // MARK: - LifeCycle Hooks
    
    override func viewWillAppear(_ animated: Bool) {
        APIFunctions.functions.fetchNotes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        APIFunctions.functions.fetchNotes()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchNotes()
        notesTableView.delegate = self
        notesTableView.dataSource = self
    }
    
    // MARK: - Tableview delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath) as! NotePrototypeCell
        
        cell.date.text = notesArray[indexPath.row].date
        cell.note.text = notesArray[indexPath.row].text
        
        return cell
    }
    
    
}

protocol DataDelegate {
    func updateArray(newArray: String)
}


extension ViewController: DataDelegate {
    
    func updateArray(newArray: String){
        do{
            notesArray = try JSONDecoder().decode([Note].self, from: newArray.data(using: .utf8)!)
        }
        catch{
            print("Failed to Decode")
        }
        self.notesTableView?.reloadData()
    }
}

