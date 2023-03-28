//
//  ViewController.swift
//  SimpleStars
//
//  Created by SreelekhN on 03/28/2023.
//  Copyright (c) 2023 SreelekhN. All rights reserved.
//

import UIKit
import SimpleStars

final class ViewController: UIViewController {
    
    @IBOutlet weak var starsContainer: StarsViewComponent!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.starsContainer.delegate = self
    }
}

extension ViewController: SimpleStarsViewBinding {
    
    func userTappedRating(rating: Int) {
        print(rating)
    }
    
    func numberOfStars() -> Int {
        7
    }
    
    func currentRating() -> Int {
        4
    }
}
