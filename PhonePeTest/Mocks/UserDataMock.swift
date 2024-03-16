//
//  UserDataMock.swift
//  PhonePeTest
//
//  Created by Sheetal Jha on 16/03/24.
//

import Foundation

final class UserDataMock {
    static let shared = UserDataMock()

    let latitude = 12.971599 // User's current Latitude
    let longitude = 77.594566 // User's current Longitude
    let initialSearchQuery = "s"
    var initialSearchRange = 1000
}
