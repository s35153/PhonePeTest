//
//  CacheService.swift
//  PhonePeTest
//
//  Created by Sheetal Jha on 16/03/24.
//

import Foundation

final class CacheService {
    static let shared = CacheService()

    func saveDataToUserDefaults(data: [Venues]?) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(data) {
            UserDefaults.standard.set(encoded, forKey: venueKey)
        }
    }

    func retrieveDataFromUserDefaults() -> [Venues]? {
        if let savedData = UserDefaults.standard.object(forKey: venueKey) as? Data {
            let decoder = JSONDecoder()
            if let loadedData = try? decoder.decode([Venues].self, from: savedData) {
                return loadedData
            }
        }
        return nil
    }

    private let venueKey = "venue.persist.last"
}
