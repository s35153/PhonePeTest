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
        if let lastCallTime = lastAPICallTime, Date().timeIntervalSince(lastCallTime) < 0.1 {
            print("skip since api is called too early")
            return
        }
        lastAPICallTime = Date()

        fetchForFirstAppSession()
        let latitude = UserDataMock.shared.latitude
        let longitude = UserDataMock.shared.longitude
        let range = "\(UserDataMock.shared.initialSearchRange)mi"
        let query = UserDataMock.shared.initialSearchQuery

        APIService.fetchVenues(latitude: latitude, longitude: longitude, range: range, query: query) { [weak self] data in
            self?._venues = data?.venues ?? []
            CacheService.shared.saveDataToUserDefaults(data: data?.venues)
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
    private var freshAppSession = true
    private var lastAPICallTime: Date?

    private func fetchForFirstAppSession() {
        guard freshAppSession else { return }
        _venues = CacheService.shared.retrieveDataFromUserDefaults() ?? []
        onDataUpdate?()
        freshAppSession = false
    }
}
