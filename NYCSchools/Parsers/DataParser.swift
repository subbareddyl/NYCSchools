//
//  DataParser.swift
//  NYCSchools
//
//  Created by Subbareddy l on 11/20/22.
//

import Foundation

protocol DataParser {
    func parseData(data: Data, completion:@escaping (Any?, Error?)->Void)
}
