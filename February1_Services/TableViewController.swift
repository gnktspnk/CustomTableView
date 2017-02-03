//
//  TableViewController.swift
//  February1_Services
//
//  Created by Gennadii Tsypenko on 01.02.17.
//  Copyright © 2017 Gennadii Tsypenko. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{
    
    static var todos = [Todo?]()
    static var semaphore  = DispatchSemaphore(value: 0)
    let cellId = "cellId"
    
    var messageFrame = UIView()
    var strLabel = UILabel()
    static let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)

    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.lightGray
        tableView.register(TableCell.self, forCellReuseIdentifier: cellId)
        
        
        let activityIndicator = TableViewController.activityIndicator
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.isHidden = false
        activityIndicator.center = tableView.center
        tableView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        API.fetchTodos()
        let _ = TableViewController.semaphore.wait(timeout: DispatchTime.distantFuture)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableCell
        
        if let todo = TableViewController.todos[indexPath.row]{
        
        cell.idLabel.text = String(todo.id)
        cell.idUserLabel.text = String(todo.userId)
        cell.titleLabel.text = todo.title
        cell.progressImage.image = todo.completed! ? UIImage(named: "success")  : UIImage(named : "stopwatch")
            
        }else{
            cell.textLabel?.text = "Unkwown todo"
        }
         return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableViewController.todos.count
    }
}



