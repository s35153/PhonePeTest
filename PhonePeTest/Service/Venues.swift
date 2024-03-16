/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Venues : Codable {
	let state : String?
	let name_v2 : String?
	let postal_code : String?
	let name : String?
	let links : [String]?
	let timezone : String?
	let url : String?
	let score : Int?
	let location : Location?
	let address : String?
	let country : String?
	let has_upcoming_events : Bool?
	let num_upcoming_events : Int?
	let city : String?
	let slug : String?
	let extended_address : String?
	let stats : Stats?
	let id : Int?
	let popularity : Int?
	let access_method : String?
	let metro_code : Int?
	let capacity : Int?
	let display_location : String?

	enum CodingKeys: String, CodingKey {

		case state = "state"
		case name_v2 = "name_v2"
		case postal_code = "postal_code"
		case name = "name"
		case links = "links"
		case timezone = "timezone"
		case url = "url"
		case score = "score"
		case location = "location"
		case address = "address"
		case country = "country"
		case has_upcoming_events = "has_upcoming_events"
		case num_upcoming_events = "num_upcoming_events"
		case city = "city"
		case slug = "slug"
		case extended_address = "extended_address"
		case stats = "stats"
		case id = "id"
		case popularity = "popularity"
		case access_method = "access_method"
		case metro_code = "metro_code"
		case capacity = "capacity"
		case display_location = "display_location"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		name_v2 = try values.decodeIfPresent(String.self, forKey: .name_v2)
		postal_code = try values.decodeIfPresent(String.self, forKey: .postal_code)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		links = try values.decodeIfPresent([String].self, forKey: .links)
		timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		score = try values.decodeIfPresent(Int.self, forKey: .score)
		location = try values.decodeIfPresent(Location.self, forKey: .location)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		has_upcoming_events = try values.decodeIfPresent(Bool.self, forKey: .has_upcoming_events)
		num_upcoming_events = try values.decodeIfPresent(Int.self, forKey: .num_upcoming_events)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		extended_address = try values.decodeIfPresent(String.self, forKey: .extended_address)
		stats = try values.decodeIfPresent(Stats.self, forKey: .stats)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		popularity = try values.decodeIfPresent(Int.self, forKey: .popularity)
		access_method = try values.decodeIfPresent(String.self, forKey: .access_method)
		metro_code = try values.decodeIfPresent(Int.self, forKey: .metro_code)
		capacity = try values.decodeIfPresent(Int.self, forKey: .capacity)
		display_location = try values.decodeIfPresent(String.self, forKey: .display_location)
	}

}