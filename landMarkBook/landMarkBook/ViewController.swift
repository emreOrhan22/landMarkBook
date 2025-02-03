//
//  ViewController.swift
//  landMarkBook
//
//  Created by Emre on 3.02.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var landMarkNames = [String]()
    var landMarkImages = [UIImage]()
    
    var chosenLandMarkName = ""
    var chosenLandMarkImage = UIImage()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        landMarkNames.append("Eye Of London")
        landMarkNames.append("Buckingham Palace")
        landMarkNames.append("Big Ben")
        landMarkNames.append("British Museum")
        
        landMarkImages.append(UIImage(named: "londonEye.jpg")!)
        landMarkImages.append(UIImage(named: "buckinghamPalace.jpg")!)
        landMarkImages.append(UIImage(named: "bigBen.jpg")!)
        landMarkImages.append(UIImage(named: "britishMuseum.jpg")!)


    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        content.text = landMarkNames[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandMarkName = landMarkNames[indexPath.row]
        chosenLandMarkImage = landMarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandMarkName = chosenLandMarkName
            destinationVC.selectedLandMarkImage = chosenLandMarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landMarkNames.remove(at: indexPath.row)
            self.landMarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


}

x
