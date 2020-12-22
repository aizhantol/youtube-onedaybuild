//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Aizhan Tolebayeva on 19.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

