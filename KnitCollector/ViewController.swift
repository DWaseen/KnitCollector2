//
//  ViewController.swift
//  KnitCollector
//
//  Created by Dan Waseen on 1/7/18.
//  Copyright © 2018 RevWon. All rights.. reserved....
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var knits : [Knit] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
        knits = try context.fetch(Knit.fetchRequest())
            tableView.reloadData()
        }
        catch{
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return knits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let knit = knits[indexPath.row]
        cell.textLabel?.text = knit.title
        cell.imageView?.image = UIImage(data: knit.knitImage as! Data)
        return cell
    }
}

