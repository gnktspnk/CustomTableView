//
//  API.swift
//  February1_Services
//
//  Created by Gennadii Tsypenko on 01.02.17.
//  Copyright © 2017 Gennadii Tsypenko. All rights reserved.
//

import Foundation
import UIKit

class API : NSObject {
    
   static let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
   static let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    
    
    static func fetchTodos(){
    let task = urlSession.dataTask(with: url!, completionHandler: completionDT)
    task.resume()
    }
    
   private static func completionDT(data: Data?, response: URLResponse?, error: Error?){
        
        guard let data = data else{
            print("No Data from service")
            return
        }
        
        guard let  todosData = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String : Any]] else{
            print("Error in getting JSON Data")
            return
        }
        
        TableViewController.todos = todosData!.map(Todo.init)
        TableViewController.activityIndicator.stopAnimating()
        TableViewController.semaphore.signal()
    }
    
}
