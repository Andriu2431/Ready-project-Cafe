//
//  TableViewController.swift
//  Cafe
//
//  Created by Andriu on 28.02.2022.
//

import UIKit

class TableViewController: UITableViewController {


    let CafeArray = ["Еспрессо","Капуччино","Мокаччино","Латте","Ристретто","Мокко","Гляссе","Кофе по-турецки","Американо"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CafeArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
        
        cell.imageView?.image = UIImage(named: CafeArray[indexPath.row])
        cell.imageView?.layer.cornerRadius = 30
        cell.imageView?.layer.masksToBounds = true
        cell.textLabel?.text = CafeArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Snell Roundhand", size: 25)
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Detail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailsVC = segue.destination as! ViewControllerEnd
                detailsVC.trackTitle = CafeArray[indexPath.row]
            }
        }
    }


}
