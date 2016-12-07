//
//  ViewController.swift
//  touchIdAutenthication
//
//  Created by Łukasz Klimkiewicz on 07.12.2016.
//  Copyright © 2016 Łukasz Klimkiewicz. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var authClicked: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         //touchIdCall()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func authClickedAction(_ sender: Any) {
        touchIdCall()
    }

    func touchIdCall(){
        let authContext : LAContext = LAContext()
        var error : NSError? = nil
        if authContext.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error){
            authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Testowanie touch id", reply: { (success, error) in
                    if success {
                        print(self.statusLabel.isHidden)
                        self.statusLabel.isHidden = false
                        self.statusLabel.text = "Odcisk prawidłowy"
                    }else{
                        self.statusLabel.isHidden = false
                        self.statusLabel.text = "Odcisk nieprawidłowy"
                    }
            })
        }else{
            
        }
    }
    
}

