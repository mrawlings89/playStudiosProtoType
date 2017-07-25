//
//  LaunchViewController.swift
//  playStudiosPrototype
//
//  Created by Michael Rawlings on 7/10/17.
//  Copyright © 2017 Michael Rawlings. All rights reserved.
//

import Foundation
import Foundation
import UIKit


class LaunchViewController : UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imgListArray :NSMutableArray = []
        for countValue in 1...18
        {
            var strImageName : String = "a\(countValue).png"
            var image  = UIImage(named:strImageName)
            imgListArray.add(image)
        }
        
        self.imageView.contentMode = UIViewContentMode.center
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [-200, 200, 0]
        animation.keyTimes = [0, 0.5, 1.0, 1.5, 2.0, 2.5]
        animation.duration = 0.65
        animation.isAdditive = true
        
        self.imageView.layer.add(animation, forKey: "move")
        
        //let theImages = NSArray(array: imgListArray) as? [UIImage]
        
        let theImages: [UIImage] = [UIImage(named: "dailytracker.png")!]
        self.imageView.contentMode = UIViewContentMode.scaleAspectFit
        self.imageView.animationImages = theImages;
        self.imageView.animationDuration = 1.0
        self.imageView.startAnimating()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
            self.performSegue(withIdentifier: "Intro", sender: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    /*
     func animateView() {
     setOptions()
     ballView.animate()
     }
     */
    
    
    
}

