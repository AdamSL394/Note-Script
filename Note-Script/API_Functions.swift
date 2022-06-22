//
//  API_Functions.swift
//  Note-Script
//
//  Created by Adam Lehrer on 6/20/22.
//

import Foundation
import Alamofire
import SwiftUI

struct Note: Decodable {
    let star: String
    let date : String
    let _id : String
    let text : String
    
}

class APIFunctions{
    
    var delegate: DataDelegate?
    
    static let functions = APIFunctions()
    
    func fetchNotes() {
        
        AF.request("https://note-script-dev.herokuapp.com/users/all?id=112890888052131625129001").response { response in
            
            print("adam",response.data)
            
            let data = String(data: response.data! , encoding: .utf8)
            
            self.delegate?.updateArray(newArray: data!)
     
        }
    }
    
    func AddNote(date:  String, text: String, userId:String){
        
        AF.request("https://note-script-dev.herokuapp.com/users/note", method: .post,parameters:["date":date,"text":text,"userId":"112890888052131625129001","star":false,"edit":false], encoding: URLEncoding.httpBody, headers:["date":date,"text":text]).responseJSON {
            response in
            let data = String(data: response.data! , encoding: .utf8)
            print(response)
        }
        
    }
    
    func updateNote(date:String, text:String, id:String){
        AF.request("https://note-script-dev.herokuapp.com/users/update/\(id)", method: .patch,parameters:["date":date,"text":text, "id":id,"star":0,"edit":false], encoding: URLEncoding.httpBody ).responseJSON{
            response in
            print(response)
        }
    }
}
