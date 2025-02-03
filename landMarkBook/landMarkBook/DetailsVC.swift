//
//  DetailsVC.swift
//  landMarkBook
//
//  Created by Emre on 3.02.2025.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var landMarkLabel: UILabel!
    @IBOutlet weak var landMarkImage: UIImageView!
    
    var selectedLandMarkName = ""
    var selectedLandMarkImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        landMarkLabel.text = selectedLandMarkName
        landMarkImage.image = selectedLandMarkImage
        
    }
    

    

}
