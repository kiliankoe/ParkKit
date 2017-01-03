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

public struct ParkKit {
    let serverURL: URL

    public init(withURL url: URL = URL(string: "https://api.parkendd.de")!) {
        self.serverURL = url
    }

    public func fetchCities(_ completion: @escaping (MetaResponse?, ParkError?) -> Void) {
        URLSession.shared.dataTask(with: serverURL) { (data, response, error) in
            guard error == nil else {
                completion(nil, .notFound)
                return
            }

            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                completion(nil, .notFound)
                return
            }

            switch statusCode / 100 {
            case 4:
                return
            case 5:
                return
            default:
                break
            }

            guard let data = data else {
                completion(nil, .notFound)
                return
            }

            guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                completion(nil, .notFound)
                return
            }

            print(json)
            completion(nil, nil)
        }.resume()
    }
}
