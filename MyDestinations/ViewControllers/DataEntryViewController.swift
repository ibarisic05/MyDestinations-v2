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
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var latTextField: UITextField!
    @IBOutlet weak var longLabel: UILabel!
    @IBOutlet weak var longTextField: UITextField!
    
    // MARK: - Variables
    weak var delegate: DataEntryViewControllerDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Unos nove destinacije"
        
        titleLabel.text = "Naziv:"
        descriptionLabel.text = "Opis:"
        latLabel.text = "Lat:"
        longLabel.text = "Long:"
        urlLabel.text = "URL:"
        
        saveButton.setTitle("Save", for: .normal)
        
        titleTextField.delegate = self
        descriptionTextField.delegate = self
        latTextField.delegate = self
        longTextField.delegate = self
        urlTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    // MARK: - Actions
    @IBAction func onTouchSaveButton(_ sender: Any) {
        
        guard let titleText = titleTextField.text else {return}
        guard let descriptionText = descriptionTextField.text else {return}
        
        guard titleText.count > 0 && descriptionText.count > 0 else {return}
        
        let lat: Double? = Double(latTextField.text ?? "")
        let long: Double? = Double(longTextField.text ?? "")

        let destination = Destination(title: titleText, description: descriptionText, lat: lat, long: long, imageUrl: urlTextField.text)
        
        delegate?.created(newDestination: destination)
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension DataEntryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
