/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Geolocation : Codable {
	let lat : Double?
	let lon : Double?
	let city : String?
	let state : String?
	let country : String?
	let postal_code : String?
	let display_name : String?
	let metro_code : String?
	let range : String?

	enum CodingKeys: String, CodingKey {

		case lat = "lat"
		case lon = "lon"
		case city = "city"
		case state = "state"
		case country = "country"
		case postal_code = "postal_code"
		case display_name = "display_name"
		case metro_code = "metro_code"
		case range = "range"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		lat = try values.decodeIfPresent(Double.self, forKey: .lat)
		lon = try values.decodeIfPresent(Double.self, forKey: .lon)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		postal_code = try values.decodeIfPresent(String.self, forKey: .postal_code)
		display_name = try values.decodeIfPresent(String.self, forKey: .display_name)
		metro_code = try values.decodeIfPresent(String.self, forKey: .metro_code)
		range = try values.decodeIfPresent(String.self, forKey: .range)
	}

}