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
        setupLoader()
        setupSearchBar()
        setupTableView()

        self.title = "PhonePe Test (Nearby App)"
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(resignSearchBarFirstResponder))
        self.view.addGestureRecognizer(tapGesture)


        let latitude = UserLocationMock.shared.latitude
        let longitude = UserLocationMock.shared.longitude
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
            $0.left.right.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(searchBarHeight)
        }
    }

    private func setupTableView() {
        view.addSubview(tableView)

        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).inset(-16)
            $0.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

    @objc private func resignSearchBarFirstResponder() {
        searchBar.resignFirstResponder()
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

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
}

// MARK: - UISearchBarDelegate

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        if let searchText = searchBar.text {
            print("Searching for: \(searchText)")
        }

        resignSearchBarFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        resignSearchBarFirstResponder()
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = "Row \(indexPath.row)"

        return cell
    }
}
