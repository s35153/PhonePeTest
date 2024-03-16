//
//  ViewController.swift
//  PhonePeTest
//
//  Created by Sheetal Jha on 16/03/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLoader()
        
        
        // Example usage:
        let latitude = 12.971599 // User's current Latitude
        let longitude = 77.594566 // User's current Longitude
        let range = "12mi" // Filter to search venues based on distance
        let query = "ub" // Filter venues based on name
        
        APIService.fetchVenues(latitude: latitude, longitude: longitude, range: range, query: query) {
            print($0)
        }
        
    }
    
    private func setupLoader() {
        let loaderView = LoaderView()
        view.addSubview(loaderView)
        loaderView.startAnimating()
    }
}

