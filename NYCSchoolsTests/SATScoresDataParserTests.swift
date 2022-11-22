//
//  SATScoresDataParserTests.swift
//  NYCSchoolsTests
//
//  Created by Subbareddy l on 11/22/22.
//

import XCTest
@testable import NYCSchools

final class SATScoresDataParserTests: XCTestCase {
    
    func testSATScoresDataParsingSuccess() throws {
        let jsonObject: [Any] = [[
            "dbn":"test",
            "school_name":"Don Bosco",
            "num_of_sat_test_takers":"100",
            "sat_critical_reading_avg_score": "25.5",
            "sat_math_avg_score": "12.3",
            "sat_writing_avg_score": "13.7"
        ]]
        var actualData: Any?
        var actualError: Error?
        let completion: (Any?, Error?) -> Void = { data, error in
            actualData = data
            actualError = error
        }
        let testData = try? JSONSerialization.data(withJSONObject: jsonObject)
        if let testData = testData {
            SATScoresDataParser().parseData(data: testData, completion: completion)
        } else {
            XCTFail("Invalid test data")
        }
        let satScores = actualData as? [SATScores]
        if let satScores = satScores, satScores.count > 0 {
            XCTAssertEqual(satScores[0].dbn, "test")
            XCTAssertEqual(satScores[0].school_name, "Don Bosco")
            XCTAssertEqual(satScores[0].num_of_sat_test_takers, "100")
            XCTAssertEqual(satScores[0].sat_critical_reading_avg_score, "25.5")
            XCTAssertEqual(satScores[0].sat_math_avg_score, "12.3")
            XCTAssertEqual(satScores[0].sat_writing_avg_score, "13.7")
        } else {
            XCTFail("SATScores empty")
        }
        XCTAssertNil(actualError)
    }
    
    func testSATScoresDataParsingFailure() throws {
        let jsonObject: [Any] = [[
            "school_name":"Don Bosco",
            "num_of_sat_test_takers":"test 100",
            "sat_critical_reading_avg_score": "25.5",
            "sat_math_avg_score": "12.3",
            "sat_writing_avg_score": "13.7"
        ]]
        var actualData: Any?
        var actualError: Error?
        let completion: (Any?, Error?) -> Void = { data, error in
            actualData = data
            actualError = error
        }
        let testData = try? JSONSerialization.data(withJSONObject: jsonObject)
        if let testData = testData {
            SATScoresDataParser().parseData(data: testData, completion: completion)
        } else {
            XCTFail("Invalid test data")
        }
        XCTAssertNil(actualData)
        XCTAssertNotNil(actualError)
    }
}
