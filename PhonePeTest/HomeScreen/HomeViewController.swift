//
//  ViewController.swift
//  PhonePeTest
//
//  Created by Sheetal Jha on 16/03/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    private lazy var loaderView: LoaderView = {
        LoaderView()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "PhonePe Test (Nearby App)"
        setupLoader()


        // Example usage:
        let latitude = 12.971599 // User's current Latitude
        let longitude = 77.594566 // User's current Longitude
        let range = "12mi" // Filter to search venues based on distance
        let query = "ub" // Filter venues based on name

        APIService.fetchVenues(latitude: latitude, longitude: longitude, range: range, query: query) { [weak self] in
            print($0)
            DispatchQueue.main.async {
                self?.loaderView.stopAnimating()
            }
        }

    }

    private func setupLoader() {
        view.addSubview(loaderView)
        loaderView.startAnimating()

        loaderView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

