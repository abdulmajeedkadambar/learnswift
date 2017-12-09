//
//  ViewController.swift
//  LearnSwift4
//
//  Created by Abdul Majeed K on 08/12/17.
//  Copyright © 2017 Wafa Fathima. All rights reserved.
//

import UIKit

protocol ReusableView : class {
    static var reuseIdentifier : String {get}
}

extension ReusableView where Self: UITableViewCell  {
    static var reuseIdentifier : String {
        return String(describing: self)
    }
}

extension UITableViewCell : ReusableView {}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let dataSource : [String] = ["Abdul Majeed Kadambar Bangalore Singapore Mangalore", "Abdul Razak","Wafa Fathima", "Sabeena Roshni","Chabbi"]
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)
            
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.estimatedRowHeight = 44
            self.tableView.rowHeight = UITableViewAutomaticDimension
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier)
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.text = dataSource[indexPath.row]
        return cell!
    }
    
}

