import Foundation

typealias JSON = [String: Any]

/// All methods to fetch data from the server are built into this type.
public struct ParkKit {
    internal let serverURL: URL

    /// Initialize a new client with a server URL. Defaults to server at parkendd.de if no URL is provided.
    ///
    /// - Parameter url: optional custom server URL
    public init(withURL url: URL = URL(string: "https://api.parkendd.de")!) {
        self.serverURL = url
    }

    enum Endpoint {
        case meta
        case city(String)
    }

    func url(for endpoint: Endpoint) -> URL? {
        switch endpoint {
        case .meta:
            return self.serverURL
        case .city(let city):
            var components = URLComponents(url: self.serverURL, resolvingAgainstBaseURL: false)
            components?.path = "/" + city
            return components?.url
        }
    }

    /// Fetch all cities known to the server.
    ///
    /// - Parameter completion: handler given a Result containing further information
    public func cities(session: URLSession = .shared,
                       completion: @escaping (Result<MetaResponse, ParkError>) -> Void) {
//        request(url: self.serverURL, session: session) {
//            (result: Result<MetaResponse, ParkError>) in
//
//            completion(result)
////            switch result {
////            case .success(let value):
////                completion(.success(value))
////            case .failure(let error):
////                completion(.failure(error))
////            }
//        }
        request(url: self.serverURL, session: session, completion: completion)
    }

//    public func fetchCities(completion: @escaping (Result<MetaResponse, ParkError>) -> Void) {
//        fetchJSON(url: serverURL) { result in
//            switch result {
//            case let .failure(error):
//                completion(Result(failure: error))
//                return
//            case let .success(json):
//                let apiVersion = (json["api_version"] as? String) ?? ""
//                let serverVersion = (json["server_version"] as? String) ?? ""
//                let reference = (json["reference"] as? String) ?? ""
//
//                guard let citiesDict = json["cities"] as? JSON else { completion(Result(failure: ParkError.decoding)); return }
//
//                let cities = citiesDict.flatMap { (_: String, value: Any) -> City? in
//                    guard let details = value as? JSON else { return nil }
//                    return try? City(object: details)
//                }.sorted { $0.name < $1.name }
//
//                let response = MetaResponse(apiVersion: apiVersion, serverVersion: serverVersion, reference: reference, cities: cities)
//                completion(Result(success: response))
//            }
//        }
//    }
//
//    /// Fetch all known lots for a given city.
//    ///
//    /// - Parameters:
//    ///   - city: city name
//    ///   - completion: handler given a Result containing further information
//    public func fetchLots(forCity city: String, completion: @escaping (Result<LotResponse, ParkError>) -> Void) {
//        guard let url = URL(string: city, relativeTo: serverURL) else { completion(Result(failure: ParkError.invalidServerURL)); return }
//        fetchJSON(url: url) { result in
//            switch result {
//            case let .failure(error):
//                completion(Result(failure: error))
//                return
//            case let .success(json):
//                let lastDownloadedStr = (json["last_downloaded"] as? String) ?? ""
//                let lastUpdatedStr = (json["last_updated"] as? String) ?? ""
//
//                let iso = DateFormatter.iso
//                let lastDownloaded = iso.date(from: lastDownloadedStr) ?? Date()
//                let lastUpdated = iso.date(from: lastUpdatedStr) ?? Date()
//
//                guard let lotsArr = json["lots"] as? [JSON] else { completion(Result(failure: ParkError.decoding)); return }
//                let lots = lotsArr.flatMap { return try? Lot(object: $0) }
//                let response = LotResponse(lastDownloaded: lastDownloaded, lastUpdated: lastUpdated, lots: lots)
//                completion(Result(success: response))
//            }
//        }
//    }

    public func lots(forCity city: String,
                     session: URLSession = .shared,
                     completion: @escaping (Result<LotResponse, ParkError>) -> Void) {
        guard let url = url(for: .city(city)) else {
            completion(.failure(.invalidServerURL))
            return
        }
        request(url: url, session: session) {
            (result: Result<LotResponse, ParkError>) in

            completion(result)
        }
    }

//
//    /// Fetch forecast data for a given lot and city.
//    ///
//    /// - Parameters:
//    ///   - lot: lot identifier
//    ///   - city: city name
//    ///   - start: starting date
//    ///   - end: ending date
//    ///   - completion: handler given a Result containing further information
//    public func fetchForecast(forLot lot: String, inCity city: String, startingAt start: Date, endingAt end: Date, completion: @escaping (Result<ForecastResponse, ParkError>) -> Void) {
//        let iso = DateFormatter.iso
//        guard let url = URL(string: "\(city)/\(lot)/timespan?from=\(iso.string(from: start))&to=\(iso.string(from: end))", relativeTo: serverURL) else { completion(Result(failure: ParkError.invalidServerURL)); return }
//        fetchJSON(url: url) { result in
//            switch result {
//            case let .failure(error):
//                completion(Result(failure: error))
//                return
//            case let .success(json):
//                let version = (json["version"] as? Double) ?? -1
//                guard let data = json["data"] as? [String: String] else { completion(Result(failure: ParkError.decoding)); return }
//
//                let forecast = data.flatMap { (key: String, value: String) -> (Date, Int)? in
//                    guard
//                        let date = iso.date(from: key),
//                        let load = Int(value)
//                    else { return nil }
//                    return (date, load)
//                }.sorted { first, second in first.0 < second.0 }
//
//                let response = ForecastResponse(version: version, forecast: forecast)
//                completion(Result(success: response))
//            }
//        }
//    }
//
//    public enum Day {
//        case today
//        case offsetFromToday(Int)
//    }
//
//    /// Fetch forecast data for a given lot and city.
//    ///
//    /// - Parameters:
//    ///   - lot: lot identifier
//    ///   - city: city name
//    ///   - day: today or day specified via offset from today for which data is to be loaded from 00:00 to 23:59
//    ///   - completion: handler given a Result containing further information
//    public func fetchForecast(forLot lot: String, inCity city: String, forDay day: Day, completion: @escaping (Result<ForecastResponse, ParkError>) -> Void) {
//        guard var startingDate = Date.startOfToday else { completion(Result(failure: ParkError.invalidDate)); return }
//
//        switch day {
//        case .today:
//            break
//        case let .offsetFromToday(offset):
//            startingDate = startingDate.addingTimeInterval(TimeInterval(offset * 24 * 60 * 60))
//        }
//
//        let endingDate = startingDate.addingTimeInterval((24 * 60 * 60) - 1)
//        fetchForecast(forLot: lot, inCity: city, startingAt: startingDate, endingAt: endingDate, completion: completion)
//    }
//
//    /// Fetch forecast data for a given lot and city.
//    ///
//    /// - Parameters:
//    ///   - lot: lot identifier
//    ///   - city: city name
//    ///   - day: `Date` somewhere inside the day for which data will be loaded from 00:00 to 23:59
//    ///   - completion: handler given a Result containing further information
//    public func fetchForecast(forLot lot: String, inCity city: String, forDay day: Date = Date(), completion: @escaping (Result<ForecastResponse, ParkError>) -> Void) {
//        guard let startingDate = Date.startOfToday else { completion(Result(failure: ParkError.invalidDate)); return }
//        let endingDate = startingDate.addingTimeInterval((24 * 60 * 60) - 1)
//        fetchForecast(forLot: lot, inCity: city, startingAt: startingDate, endingAt: endingDate, completion: completion)
//    }
//
//    internal func fetchJSON(url: URL, completion: @escaping (Result<JSON, ParkError>) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, resp, err in
//            guard err == nil else { completion(Result(failure: err!)); return }
//            guard let status = (resp as? HTTPURLResponse)?.statusCode else { completion(Result(failure: ParkError.request(nil))); return }
//            switch status / 100 {
//            case 4:
//                completion(Result(failure: ParkError.notFound))
//                return
//            case 5:
//                completion(Result(failure: ParkError.server(statusCode: status)))
//                return
//            default:
//                break
//            }
//            guard let data = data else { completion(Result(failure: ParkError.unknown)); return }
//            guard
//                let rawJson = try? JSONSerialization.jsonObject(with: data),
//                let json = rawJson as? JSON
//            else {
//                completion(Result(failure: ParkError.decoding))
//                return
//            }
//            completion(Result(success: json))
//        }.resume()
//    }

    private func request<T: Decodable>(url: URL,
                                       session: URLSession,
                                       completion: @escaping (Result<T, ParkError>) -> Void) {
        let task = session.dataTask(with: url) { data, response, error in
            guard 
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse
            else {
                completion(.failure(.request(error)))
                return
            }

            switch response.statusCode {
            case 400...499:
                completion(.failure(.notFound))
            case 500...599:
                completion(.failure(.server(statusCode: response.statusCode)))
            default:
                break
            }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            do {
                let value = try decoder.decode(T.self, from: data)
                completion(.success(value))
            } catch {
                guard let decodingError = error as? DecodingError else {
                    assertionFailure("unexpected error: \(error)")
                    return
                }
                completion(.failure(.json(decodingError)))
            }
        }

        task.resume()
    }
}
