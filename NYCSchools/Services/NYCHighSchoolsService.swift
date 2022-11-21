//
//  NYCHighSchoolsService.swift
//  NYCSchools
//
//  Created by Subbareddy l on 11/19/22.
//

import Foundation

class NYCHighSchoolsService: NetworkRequestService {
    var urlRequest: URLRequest
    var urlSessionDataTask: URLSessionDataTask?
    
    init(urlString: String) {
        urlRequest = URLRequest(url: URL(string: urlString)!)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("PzSs9Gl8TsPolLBejVrGqdIrP", forHTTPHeaderField: "X-App-Token")
    }
    
    func getData(parser: DataParser, completion: @escaping (Any?, Error?)->Void) {
        urlSessionDataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let data = data {
                parser.parseData(data: data, completion: completion)
            }
        }
        urlSessionDataTask?.resume()
    }
}
