//
//  ViewController.swift
//  playStudiosPrototype
//
//  Created by Michael Rawlings on 7/10/17.
//  Copyright © 2017 Michael Rawlings. All rights reserved.
//

import UIKit
import Leanplum


class ViewController: UIViewController {

var initialLevel = liteEventRank
var updatedLevel = ""
    
override func viewDidLoad() {
    display.text! = liteEventRank
    super.viewDidLoad()
   
    }
    
    
    func sendToLP (){
            Leanplum.track("levelChange", withParameters: ["newLevel": self.updatedLevel, "oldLevel": self.initialLevel])
            }
    
    weak var display: UILabel!
    
    @IBAction func liteRankAppend(_ sender: UIButton){
        let oldLevel = display.text!
        initialLevel = oldLevel
        let newLevel = sender.currentTitle!
        updatedLevel = newLevel
        Leanplum.setUserAttributes (["liteEventRank": newLevel])
        Leanplum.forceContentUpdate()
        display.text! = newLevel
        print("Old Level =" + oldLevel)
        print("New Level =" + newLevel)
    
    sendToLP()
    
        }
  
    @IBAction func linkedDataMessage(_ sender: UIButton) {
        Leanplum.track("linkedDataMessage")
//        Leanplum.track(LP_PURCHASE_EVENT, withValue:10, andCurrencyCode:"EUR")
    
    }
    
    @IBAction func fireLiteEventMessage(_ sender: UIButton) {
        Leanplum.track("liteEventFire")
        Leanplum.track(LP_PURCHASE_EVENT, withValue:0, andParameters:["localCurrency":"EUR", "localPrice":"100.0"])
        print("Display is=" + display.text!)
    }
    
}
