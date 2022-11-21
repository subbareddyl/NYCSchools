//
//  SATScoresDataParser.swift
//  NYCSchools
//
//  Created by Subbareddy l on 11/21/22.
//

import Foundation

class SATScoresDataParser: DataParser {
    init() {}
    
    func parseData(data: Data, completion:@escaping (Any?, Error?)->Void) {
        let decoder = JSONDecoder()
        do {
            let SATScores = try decoder.decode([SATScores].self, from: data)
            completion(SATScores, nil)
        } catch {
            completion(nil, error)
        }
    }
}
