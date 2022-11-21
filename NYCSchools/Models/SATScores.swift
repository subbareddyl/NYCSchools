//
//  SATScores.swift
//  NYCSchools
//
//  Created by Subbareddy l on 11/21/22.
//

import Foundation

struct SATScores: Codable {
    let dbn: String
    let school_name: String
    let num_of_sat_test_takers: String
    let sat_critical_reading_avg_score: String
    let sat_math_avg_score: String
    let sat_writing_avg_score: String
}
