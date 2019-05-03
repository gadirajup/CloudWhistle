//
//  ViewController.swift
//  CloudWhistle
//
//  Created by Prudhvi Gadiraju on 5/2/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static var isDirty = false

    // Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = "What's the Whistle"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWhistle))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: nil)
    }

    
    // Handlers
    @objc fileprivate func addWhistle() {
        print("Blow my whistle baby")
        
        let recordWhistleController = RecordWhistleViewController()
        navigationController?.pushViewController(recordWhistleController, animated: true)
    }

}

