//
//  DataDisplayViewController.swift
//  MyDestinations
//
//  Created by Ivan Barisic on 19/05/2020.
//  Copyright © 2020 Ivan Barisic. All rights reserved.
//

import UIKit

class DataDisplayViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    private let cellReuseID: String = "displayCell"
    private let segueID: String = "detailsSegue"
    private var destinations: [Destination] = []
    private var selectedDestination: Destination?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Moje destinacije"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadDestinationsFromUserDefaults()
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let dataEntryVC = segue.destination as? DataEntryViewController {
            dataEntryVC.delegate = self
        } else if let destinationDetailsVC = segue.destination as? DestinationDetailsViewController, let selectedDestination = selectedDestination {
            destinationDetailsVC.destination = selectedDestination
        }
    }
}

// MARK: - Load/Store data to NSUserDefaults
extension DataDisplayViewController {
    private func loadDestinationsFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: Destination.userDefaultsKey) {
            let decoder = JSONDecoder()
            do {
                destinations = try decoder.decode([Destination].self, from: data)
                tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
    
    private func saveDestinationsToUserDefaults() {
        let encoder = JSONEncoder()
        do {
            let data: Data = try encoder.encode(destinations)
            UserDefaults.standard.set(data, forKey: Destination.userDefaultsKey)
            UserDefaults.standard.synchronize()
        } catch {
            print(error)
        }
    }
}

// MARK: - DataEntryViewControllerDelegate
extension DataDisplayViewController: DataEntryViewControllerDelegate {
    func created(newDestination: Destination) {

        destinations.append(newDestination)
        tableView.reloadData()
        
        saveDestinationsToUserDefaults()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension DataDisplayViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath) as! DataDisplayTableViewCell
        
        let destination = destinations[indexPath.row]
        cell.config(with: destination)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDestination = destinations[indexPath.row]
        performSegue(withIdentifier: segueID, sender: nil)
    }
    
    // MARK: Swipe to delete
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
        let deleteAction = UIContextualAction(style: UIContextualAction.Style.destructive, title: "Delete me") { (_, _, _) in
            self.removeDestination(at: indexPath)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

extension DataDisplayViewController {
    func removeDestination(at indexPath:IndexPath) {

        let alertController = UIAlertController(title: "Obrisi destinaciju?", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive) { (_) in
            self.destinations.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            self.saveDestinationsToUserDefaults()
        }
        alertController.addAction(deleteAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
}
