//
//  DataEntryViewController.swift
//  MyDestinations
//
//  Created by Ivan Barisic on 21/05/2020.
//  Copyright © 2020 Ivan Barisic. All rights reserved.
//

import UIKit

protocol DataEntryViewControllerDelegate: class {
    func created(newDestination: Destination)
}

class DataEntryViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - Variables
    weak var delegate: DataEntryViewControllerDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Unos nove destinacije"
        
        titleLabel.text = "Naziv:"
        descriptionLabel.text = "Opis:"
        
        saveButton.setTitle("Save", for: .normal)
        
        titleTextField.delegate = self
        descriptionTextField.delegate = self
    }

    // MARK: - Actions
    @IBAction func onTouchSaveButton(_ sender: Any) {
        
        guard let titleText = titleTextField.text else {return}
        guard let descriptionText = descriptionTextField.text else {return}
        
        guard titleText.count > 0 && descriptionText.count > 0 else {return}
        
        let destination = Destination(title: titleText, description: descriptionText)
        delegate?.created(newDestination: destination)
        navigationController?.popViewController(animated: true)
    }
}

extension DataEntryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
