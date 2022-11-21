//
//  NetworkRequestService.swift
//  NYCSchools
//
//  Created by Subbareddy l on 11/20/22.
//

protocol NetworkRequestService {
    func getData(parser: DataParser, completion: @escaping (Any?, Error?)->Void)
}
