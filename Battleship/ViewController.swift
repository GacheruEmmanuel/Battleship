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
    var gridArr : [Position]! = [Position]()
    
    @IBAction func changeNames(_ sender: UIButton) {
        sender.setTitle("fish", for: .normal)
        
        //Identifying the index of the tile pressed
        var index = 0
        while index < boardGridButtons.count {
            if boardGridButtons[index] == sender {
                break
            }
            index += 1
        }
        
        //Changing the color of the tile that was hit
        gridArr[index].hitTile(button: sender)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for _ in boardGridButtons {
            let tempPosition : Position = Position(hasShip: false)
            gridArr.append(tempPosition)
        }
        
        for button in boardGridButtons {
            button.addTarget(self, action: #selector(changeNames(_:)), for: .touchUpInside)
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

 
    
    

}

