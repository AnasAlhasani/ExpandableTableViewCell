//
//  ViewController.swift
//  ExpandableCell
//
//  Created by Anas Alhasani on 10/8/17.
//  Copyright © 2017 Anas Alhasani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var subjects = Subject.allSubjects()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Swift"
        tableView.separatorInset = .zero
        tableView.tableFooterView = UIView(frame: .zero)
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell", for: indexPath) as! ExpandableCell
        
        cell.selectionStyle = .none
        
        let subject = subjects[indexPath.row]
        
        cell.update(subject)
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let subject = subjects[indexPath.row]
        
        subject.isExpanded = !subject.isExpanded
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}


