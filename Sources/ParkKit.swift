//
//  ParkError.swift
//  ParkKit
//
//  Created by Kilian Költzsch on 03/01/2017.
//  Copyright © 2017 Kilian Koeltzsch. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]

public struct ParkKit {
    let serverURL: URL

    public init(withURL url: URL = URL(string: "https://api.parkendd.de")!) {
        self.serverURL = url
    }

    public func fetchCities(onFailure: @escaping (ParkError) -> Void, onSuccess: @escaping (MetaResponse) -> Void) {
        fetchJSON(url: serverURL, onFailure: onFailure) { json in
            let apiVersion = (json["api_version"] as? String) ?? ""
            let serverVersion = (json["server_version"] as? String) ?? ""
            let reference = (json["reference"] as? String) ?? ""

            guard let citiesDict = json["cities"] as? [String: Any] else {
                onFailure(.unknown)
                return
            }

            var cities = [City]()
            for (_, details) in citiesDict {
                guard let details = details as? NSDictionary else { continue }
                guard let city = City.from(details) else { continue }
                cities.append(city)
            }

            let response = MetaResponse(apiVersion: apiVersion, serverVersion: serverVersion, reference: reference, cities: cities)
            onSuccess(response)
        }
    }

    func fetchJSON(url: URL, onFailure fail: @escaping (ParkError) -> Void, onSuccess succeed: @escaping (JSON) -> Void) {
        URLSession.shared.dataTask(with: serverURL) { (data, response, error) in
            if let error = error {
                fail(.request(error))
                return
            }

            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                fail(.request(nil))
                return
            }

            switch statusCode / 100 {
            case 4:
                fail(.notFound)
                return
            case 5:
                fail(.server(statusCode: statusCode))
                return
            default:
                break
            }

            guard let data = data else {
                fail(.unknown)
                return
            }

            guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                fail(.decoding)
                return
            }

            succeed(json!)
        }.resume()
    }
}
