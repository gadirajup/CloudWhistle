//
//  SubmitController.swift
//  CloudWhistle
//
//  Created by Prudhvi Gadiraju on 5/2/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit
import CloudKit

class SubmitController: UIViewController {
    
    var genre: String = "Genre"
    var comments: String = "Comments"
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 30
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.alignment = .center
        sv.axis = .vertical
        return sv
    }()
    
    var status: UILabel!
    var spinner: UIActivityIndicatorView!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .purple
        
        view.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        
        status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.text = "Submitting…"
        status.textColor = UIColor.white
        status.font = UIFont.preferredFont(forTextStyle: .title1)
        status.numberOfLines = 0
        status.textAlignment = .center
        
        spinner = UIActivityIndicatorView(style: .whiteLarge)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        
        stackView.addArrangedSubview(status)
        stackView.addArrangedSubview(spinner)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Cloud Stuff"
        navigationItem.hidesBackButton = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        doSubmission()
    }
    
    @objc func doneTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    fileprivate func doSubmission() {
        let whistleRecord = CKRecord(recordType: "Whistle")
        
        whistleRecord["genre"] = genre
        whistleRecord["comments"] = comments
        
        let whistleURLAsset = CKAsset(fileURL: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("whistle.m4a"))
        whistleRecord["whistleUrl"] = whistleURLAsset
        
        CKContainer.default().publicCloudDatabase.save(whistleRecord) { [unowned self] (record, error) in
            DispatchQueue.main.async {
                if let error = error {
                    self.status.text = "Error: \(error.localizedDescription)"
                    self.spinner.stopAnimating()
                } else {
                    self.view.backgroundColor = .green
                    self.status.text = "Successfully Saved"
                    self.spinner.stopAnimating()
                    ViewController.isDirty = true
                }
                
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneTapped))
            }
        }
    }
}
