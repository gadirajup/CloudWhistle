//
//  RecordWhistleViewController.swift
//  CloudWhistle
//
//  Created by Prudhvi Gadiraju on 5/2/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit
import AVFoundation

class RecordWhistleViewController: UIViewController {
    
    // Properties
    var recordingSession: AVAudioSession!
    var whistleRecorder: AVAudioRecorder!
    
    
    // UI Elements
    var recordingButton: UIButton!
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 30
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.alignment = .center
        sv.axis = .vertical
        return sv
    }()
    
    // Init
    override func loadView() {
        view = UIView()
        view.backgroundColor = .red
        
        view.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
