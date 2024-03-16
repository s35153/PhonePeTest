//
//  ViewController.swift
//  PhonePeTest
//
//  Created by Sheetal Jha on 16/03/24.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {

    let viewModel = HomeViewViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLoader()
        setupSearchBar()
        setupSlider()
        setupTableView()
        setupKeyboardHandling()

        self.title = "PhonePe Test (Nearby App)"

        viewModel.fetchData()
        viewModel.onDataUpdate = { [weak self] in
            self?.loaderView.stopAnimating()
            self?.tableView.reloadData()
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

    private func setupSlider() {
        view.addSubview(slider)

        slider.snp.makeConstraints {
            $0.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func setupTableView() {
        view.addSubview(tableView)

        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).inset(-16)
            $0.left.right.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(slider.snp.top)
        }
    }

    private func setupKeyboardHandling() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(resignSearchBarFirstResponder))
        self.view.addGestureRecognizer(tapGesture)
    }

    @objc private func resignSearchBarFirstResponder() {
        searchBar.resignFirstResponder()
    }

    @objc func sliderValueChanged(_ sender: UISlider) {
        let range = Int(sender.value)
        UserDataMock.shared.initialSearchRange = range
        viewModel.fetchData()
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

    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 1000
        slider.value = 1000
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        return slider
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
}
