//
//  APIService.swift
//  PhonePeTest
//
//  Created by Sheetal Jha on 16/03/24.
//

import Foundation

class APIService {

    private static var debug = true

    static func fetchVenues(perPage: Int = 10,
                            page: Int = 1,
                            latitude: Double,
                            longitude: Double,
                            range: String,
                            query: String,
                            completion: @escaping (NearbyHomeResponse?) -> ()) {
        let baseURL = APIConstants.baseURL
        let clientID = APIConstants.clientID

        let urlString = "\(baseURL)?client_id=\(clientID)&per_page=\(perPage)&page=\(page)&lat=\(latitude)&lon=\(longitude)&range=\(range)&q=\(query)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let nearbyResponseModel = try? JSONDecoder().decode(NearbyHomeResponse.self, from: data)
                if debug {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }
                completion(nearbyResponseModel)
            } catch {
                print("JSON serialization error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }

}
