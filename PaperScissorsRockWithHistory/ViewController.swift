//
//  ViewController.swift
//  PaperScissorsRockWithHistory
//
//  Created by Chao Ju on 8/8/15.
//  Copyright (c) 2015 Chao Ju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myChoice:Int!
    var comChoice:Int!
    var win: Int!
    var his=[Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func comp(mc: Int, pc:Int)->Int {
        println(self.his.count)
        if mc==0 {
            if pc==0 {
                win=0
                return 3
            }
            if pc==1 {
                win=1
                return 0
            }
            if pc==2 {
                win=2
                return 2
            }
        }
        if mc==1 {
            if pc==0 {
                win=2
                return 0
            }
            if pc==1 {
                win=0
                return 3
            }
            if pc==2 {
                win=1
                return 1
            }
            
        }
        if mc==2 {
            if pc==0 {
                win=1
                return 2
            }
            if pc==1 {
                win=2
                return 1
            }
            if pc==2 {
                win=0
                return 3
            }
        }
        return 1
    }
    
    @IBAction func Paper(sender: UIButton) {
        myChoice=0
        comChoice=Int(arc4random() % 3)
        let controller=self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        controller.result=comp(myChoice, pc: comChoice)
        self.his.append(self.win)
        controller.history=self.his
        controller.winorlose=self.win
        self.presentViewController(controller, animated: true, completion: nil)
    }

    @IBAction func Rock(sender: UIButton) {
        myChoice=1
        comChoice=Int(arc4random() % 3)
        self.performSegueWithIdentifier("ShowResults", sender: self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier=="ShowResults" {
            
            let controller=segue.destinationViewController as! ResultsViewController
            controller.result=comp(myChoice, pc: comChoice)
            self.his.append(self.win)
            controller.history=self.his
            controller.winorlose=self.win
        }
        
    }
    @IBAction func Scissors(sender: UIButton) {
        myChoice=2
        comChoice=Int(arc4random() % 3)
        let controller=self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        controller.result=comp(myChoice, pc: comChoice)
        self.his.append(self.win)
        controller.history=self.his
        controller.winorlose=self.win
        self.presentViewController(controller, animated: true, completion: nil)
    }
}

