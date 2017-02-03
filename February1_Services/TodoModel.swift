//
//  Todo.swift
//  February1_Services
//
//  Created by Gennadii Tsypenko on 01.02.17.
//  Copyright © 2017 Gennadii Tsypenko. All rights reserved.
//

import UIKit

class Todo {
    
    var userId : Int!
    var id : Int!
    var title : String!
    var completed : Bool!
    
    init?(_ data : [String : Any]) {
        guard let title = data["title"] as? String,
              let userId = data["userId"] as? Int,
              let id = data["id"] as? Int,
              let completed = data["completed"] as? Bool else {
                print("Wrong json data")
                return nil
        }
        
        self.userId = userId
        self.completed = completed
        self.id = id
        self.title = title
        
        
    }
    
}

extension Todo : CustomStringConvertible {
    var description : String {
        return "\(title!)\t \(id!) \t\(userId!)"
    }
}
