//
//  ViewController.swift
//  Weather
//
//  Created by Quốc Đạt on 09.09.17.
//  Copyright © 2017 QuocDat. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if currentReachabilityStatus == .reachableViaWWAN {
            
        } else if currentReachabilityStatus == .reachableViaWiFi {
            
        } else {
            creatAlert(message: "Please Check Your Internet", title: "No internet connection")
            print("No internet connection")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func creatAlert(message: String, title: String ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true , completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

