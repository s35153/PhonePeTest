//
//  HomeViewController+Extensions.swift
//  PhonePeTest
//
//  Created by Sheetal Jha on 16/03/24.
//

import UIKit

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

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filter(with: searchText)
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let venue = viewModel.item(at: indexPath.row)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier, for: indexPath) as? HomeTableViewCell else {
            print("Error in reusing cell")
            return UITableViewCell()
        }

        cell.titleLabel.text = venue?.name
        cell.detailLabel.text = venue?.display_location

        return cell
    }
}
