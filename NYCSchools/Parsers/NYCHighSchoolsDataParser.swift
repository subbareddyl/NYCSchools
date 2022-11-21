//
//  NYCHighSchoolsDataParser.swift
//  NYCSchools
//
//  Created by Subbareddy l on 11/20/22.
//

import Foundation

class NYCHighSchoolsDataParser: DataParser {
    init() {}
    
    func parseData(data: Data, completion:@escaping (Any?, Error?)->Void) {
        let decoder = JSONDecoder()
        do {
            let schools = try decoder.decode([School].self, from: data)
            completion(schools, nil)
        } catch {
            completion(nil, error)
        }
    }
}
