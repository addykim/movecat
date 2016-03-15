//
//  ViewController.swift
//  movebox
//
//  Created by Addy Kim on 2/6/16.
//  Copyright © 2016 Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Ctrl and clicked onto the code
    @IBOutlet weak var boxview: UIView!
    
    @IBOutlet weak var catview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.timer = NSTimer(timeInterval: 1.0, target: self, selector: "keepMoving", userInfo: nil, repeats: true)
        
    }
    
    func keepMoving() {
        self.moveBoxViewToPoint(self.generateRandomPoint())
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
//        UIView.animateWithDuration(0.5, delay: 0.5 , options: UIViewAnimationOptions.CurveEaseIn, animations:
//            { () -> Void in
//                let middleWidth = self.view.frame.width/2;
//                let middleHeight = self.view.frame.height/2;
//                self.catview.center = CGPointMake(middleWidth, middleHeight);
//            }) { (completed) -> Void in
//        }
    }
    
    
    func moveBoxViewToPoint(point: CGPoint) {
        UIView.animateWithDuration(0.5, delay: 0.5 , options: UIViewAnimationOptions.CurveEaseIn, animations:
            { () -> Void in
                self.catview.center = point;
            }) { (completed) -> Void in
        }

    }
    
    func generateRandomPoint() -> CGPoint {
        let maxWidthValue = self.view.frame.width;
        let maxHeightValue = self.view.frame.height;
        let x = arc4random_uniform(UInt32(maxWidthValue))
        let y = arc4random_uniform(UInt32(maxHeightValue))
        print ("\(x),\(y)")
    
        let generatePoint = CGPointMake(CGFloat(x), CGFloat(y))
        return generatePoint
    }
    
    
    // Cmd + click on UITouch to see the class itself -> read through documentation
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Set<UITouch> can be multiple fingers
        // Indexing the first element
        let firstTouch = touches.first;

        // ? is an optional, allow variables to hold on to the value of nil, otherwise will crash
        // Allows to safely fail, an ! will cause to crash
        let firstTouchCGPoint = firstTouch?.locationInView(self.view)
        self.moveBoxViewToPoint(firstTouchCGPoint!)

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

