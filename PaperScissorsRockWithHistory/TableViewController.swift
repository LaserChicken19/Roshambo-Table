//
//  TableViewController.swift
//  PaperScissorsRockWithHistory
//
//  Created by Chao Ju on 8/8/15.
//  Copyright (c) 2015 Chao Ju. All rights reserved.
//

import UIKit
import Foundation

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    override func viewDidLoad(){
        super.viewDidLoad()
        //println(self.tableviewhistory.count)
    }
    
    var tableviewhistory=[Int]()
    var resultChoice: Int!
    let result=["Oops! It's a tie!" , "Congratulations! You win!" , "You lose!"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableviewhistory.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCellWithIdentifier("TableCell") as! UITableViewCell
        self.resultChoice=self.tableviewhistory[indexPath.row]
        cell.textLabel?.text=self.result[self.resultChoice]
        return cell
    }

    @IBAction func back(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
