//
//  ViewController.swift
//  LearnSwift4
//
//  Created by Abdul Majeed K on 08/12/17.
//  Copyright © 2017 Wafa Fathima. All rights reserved.
//

import UIKit
import QuartzCore


protocol NibLoadableView {
    static var nibName : String { get }
}

extension NibLoadableView where Self : UITableViewCell {
    static var nibName : String { return String(describing: self) }
}


protocol ReusableView : class {
    static var reuseIdentifier : String {get}
}

extension ReusableView where Self: UITableViewCell  {
    static var reuseIdentifier : String {
        return String(describing: self)
    }
}

extension UITableViewCell : ReusableView {}
extension UITableViewCell : NibLoadableView {}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let dataSource : [String] = ["Abdul Majeed Kadambar Bangalore Singapore Mangalore", "Abdul Razak","Wafa Fathima", "Sabeena Roshni","Chabbi"]
    
    
    @IBOutlet weak var headerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0
        animation.toValue = 1.0
        animation.duration = 3
        self.headerLabel.layer.add(animation, forKey: "opactiy")
    }
    

    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            
            let nibName = UINib(nibName: CustomTableViewCell.nibName, bundle: nil)
            tableView.register(nibName, forCellReuseIdentifier: CustomTableViewCell.reuseIdentifier)

            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.estimatedRowHeight = 44
            self.tableView.rowHeight = UITableViewAutomaticDimension
            
            let numberFormatter = ValueToDateFormatter()
            print(numberFormatter.string(for: 200.0)!)
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.reuseIdentifier) as! CustomTableViewCell
        cell.nameLabel.text = dataSource[indexPath.row]
        return cell
    }
    
}

