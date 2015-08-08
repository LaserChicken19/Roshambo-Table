//
//  ResultsViewController.swift
//  PaperScissorsRockWithHistory
//
//  Created by Chao Ju on 8/8/15.
//  Copyright (c) 2015 Chao Ju. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var ResultImage: UIImageView!
    
    let img=["PaperCoversRock" , "RockCrushesScissors", "ScissorsCutPaper", "ItsATie"]
    var result: Int!
    var winorlose:Int!
    var history=[Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //history.append(self.winorlose)
    }
    override func viewWillAppear(animated: Bool) {
        ResultImage.image=UIImage(named: img[self.result])
    }
    
    @IBAction func Dismiss(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func ShowTableView(sender: UIButton) {
        let controller=self.storyboard?.instantiateViewControllerWithIdentifier("TableViewController") as! TableViewController
        controller.tableviewhistory=self.history
        self.presentViewController(controller, animated: true, completion: nil)
    }
}
