//
//  School.swift
//  NYCSchools
//
//  Created by Subbareddy l on 11/19/22.
//

import Foundation

struct School: Codable {
    let dbn: String
    let school_name: String
    let overview_paragraph: String
    let neighborhood: String?
    let location: String?
    let latitude: String?
    let longitude: String?
    let phone_number: String?
    let fax_number: String?
    let school_email: String?
    let website: String?
    let finalgrades: String?
    let subway: String?
    let bus: String?
    let directions1: String?
    let requirement1_1: String?
    let requirement2_1: String?
    let requirement3_1: String?
    let requirement4_1: String?
    let requirement5_1: String?
    let city: String?
}
