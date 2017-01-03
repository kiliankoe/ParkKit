/**
 *  ParkKit
 *
 *  Copyright (c) 2017 Kilian Koeltzsch. Licensed under the MIT license, as follows:
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 */

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
            for (name, details) in citiesDict {
                let hasActiveSupport = 
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
