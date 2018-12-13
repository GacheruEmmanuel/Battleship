//
//  ViewController.swift
//  Battleship
//
//  Created by Gacheru, Emmanuel K on 12/7/18.
//  Copyright © 2018 Gacheru, Emmanuel K. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var boardGridButtons: [UIButton]!
    
    @IBAction func changeNames(_ sender: UIButton) {
        
        for button in boardGridButtons {
            button.setTitle("fish", for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

 
    
    

}

