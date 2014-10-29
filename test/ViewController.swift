//
//  ViewController.swift
//  test
//
//  Created by walex on 29/10/14.
//  Copyright (c) 2014 ATOM STUDIOS. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    lazy var manager = CMMotionManager()
    lazy var queue = NSOperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if manager.gyroAvailable {
            if manager.gyroActive == false {
                manager.gyroUpdateInterval = 1.0 / 40.0
                manager.startGyroUpdatesToQueue(queue,
                    withHandler: {(data: CMGyroData!, error: NSError!) in
                        
                        println("Gyro Rotation x = \(data.rotationRate.x)")
                        println("Gyro Rotation y = \(data.rotationRate.y)")
                        println("Gyro Rotation z = \(data.rotationRate.z)")
                        
                })
            } else {
                println("Gyro is already active")
            }
        } else {
            println("Gyro isn't available")
        }
        
        if manager.accelerometerAvailable{
            let queue = NSOperationQueue()
            manager.startAccelerometerUpdatesToQueue(queue, withHandler:
                {(data: CMAccelerometerData!, error: NSError!) in
                    
                    println("X = \(data.acceleration.x)")
                    println("Y = \(data.acceleration.y)")
                    println("Z = \(data.acceleration.z)")
                    
                }
            )
        } else {
            println("Accelerometer is not available")
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

