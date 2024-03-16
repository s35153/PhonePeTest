//
//  ViewController.swift
//  PhonePeTest
//
//  Created by Sheetal Jha on 16/03/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "PhonePe Test (Nearby App)"
        setupLoader()
        setupSearchBar()


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

    private func setupSearchBar() {
        view.addSubview(searchBar)

        searchBar.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(searchBarHeight)
        }
    }

// MARK: - Private

    private let searchBarHeight = 60

    private lazy var loaderView: LoaderView = {
        LoaderView()
    }()

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        return searchBar
    }()
}

// MARK: - UISearchBarDelegate

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        if let searchText = searchBar.text {
            print("Searching for: \(searchText)")
        }

        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}
