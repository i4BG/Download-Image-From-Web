//
//  ViewController.swift
//  Download Image From Web
//
//  Created by Ivaylo Todorov on 29.11.15 г..
//  Copyright © 2015 г. Ivaylo Todorov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
 
        override func viewDidLoad() {
            
            super.viewDidLoad()
            
            // download image from web
            let url = NSURL(string: "https://developer.apple.com/assets/elements/icons/128x128/swift.png")
            
            let urlRequest = NSURLRequest(URL: url!)
            
            NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
                
                if error != nil {
                    
                    print(error)
                    
                } else {
                
             let test = UIImage(data: data!)
                    
                    self.image.image = test
                    
                    // save image in the App
                    var documentsDirectory:String?
                    
                    var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                    
                    if paths.count > 0 {
                        
                        documentsDirectory = paths[0] as? String
                        
                        var savePath = documentsDirectory! + "/swift.png"
                        
                        NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                        
                        //use allready saved image
                        self.image.image = UIImage(named: savePath)

                    }
            
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
