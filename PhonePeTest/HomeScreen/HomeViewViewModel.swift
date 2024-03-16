//
//  HomeViewViewModel.swift
//  PhonePeTest
//
//  Created by Sheetal Jha on 16/03/24.
//

import Foundation

final class HomeViewViewModel {

    var venues: [Venues] {
        get {
            if searchText.isEmpty {
                return _venues
            }
            return _venues.filter { $0.name?.lowercased().contains(searchText) ?? false }
        }
        set {
            _venues = newValue
        }
    }
    var onDataUpdate: (() -> Void)?

    func fetchData() {
        let latitude = UserDataMock.shared.latitude
        let longitude = UserDataMock.shared.longitude
        let range = UserDataMock.shared.initialSearchRange
        let query = UserDataMock.shared.initialSearchQuery

        APIService.fetchVenues(latitude: latitude, longitude: longitude, range: range, query: query) { [weak self] data in
            self?._venues = data?.venues ?? []
            DispatchQueue.main.async {
                self?.onDataUpdate?()
            }
        }
    }

    func numberOfItems() -> Int {
        return venues.count
    }

    func item(at index: Int) -> Venues? {
        guard index < venues.count else { return nil }
        return venues[index]
    }

    // MARK: - Search Support

    func filter(with text: String) {
        searchText = text.lowercased()
        self.onDataUpdate?()
    }

    // MARK: Private
    private var _venues: [Venues] = []
    private var searchText = ""
}
