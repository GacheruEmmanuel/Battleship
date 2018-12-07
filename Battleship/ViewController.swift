//
//  ViewController.swift
//  Battleship
//
//  Created by Gacheru, Emmanuel K on 12/7/18.
//  Copyright © 2018 Gacheru, Emmanuel K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tileArr: [Tile]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var i = 0
        while i < 100 {
            tileArr.append(Tile(pos : i))
            i += 1
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hitSquare(_ sender: Any) {
        
    }


}

