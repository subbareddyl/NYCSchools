//
//  NYCSchoolsTests.swift
//  NYCSchoolsTests
//
//  Created by Subbareddy l on 11/19/22.
//

import XCTest
@testable import NYCSchools

final class NYCHighSchoolsDataParserTests: XCTestCase {
    
    func testNYCHighSchoolsDataParsingSuccess() throws {
        let jsonObject: [Any] = [[
            "dbn":"test",
            "school_name":"Don Bosco",
            "overview_paragraph":"test overview"
        ]]
        var actualData: Any?
        var actualError: Error?
        let completion: (Any?, Error?) -> Void = { data, error in
            actualData = data
            actualError = error
        }
        let testData = try? JSONSerialization.data(withJSONObject: jsonObject)
        if let testData = testData {
            NYCHighSchoolsDataParser().parseData(data: testData, completion: completion)
        } else {
            XCTFail("Invalid test data")
        }
        let schools = actualData as? [School]
        if let schools = schools, schools.count > 0 {
            XCTAssertEqual(schools[0].dbn, "test")
            XCTAssertEqual(schools[0].school_name, "Don Bosco")
            XCTAssertEqual(schools[0].overview_paragraph, "test overview")
            XCTAssertNil(schools[0].neighborhood)
            XCTAssertNil(schools[0].location)
            XCTAssertNil(schools[0].latitude)
            XCTAssertNil(schools[0].longitude)
            XCTAssertNil(schools[0].phone_number)
            XCTAssertNil(schools[0].fax_number)
            XCTAssertNil(schools[0].school_email)
            XCTAssertNil(schools[0].website)
            XCTAssertNil(schools[0].finalgrades)
            XCTAssertNil(schools[0].subway)
            XCTAssertNil(schools[0].bus)
            XCTAssertNil(schools[0].directions1)
            XCTAssertNil(schools[0].requirement1_1)
            XCTAssertNil(schools[0].requirement2_1)
            XCTAssertNil(schools[0].requirement3_1)
            XCTAssertNil(schools[0].requirement4_1)
            XCTAssertNil(schools[0].requirement5_1)
        } else {
            XCTFail("Schools empty")
        }
        XCTAssertNil(actualError)
    }
    
    func testNYCHighSchoolsDataParsingFailure() throws {
        let jsonObject: [Any] = [[
            "overview_paragraph":"test overview"
        ]]
        var actualData: Any?
        var actualError: Error?
        let completion: (Any?, Error?) -> Void = { data, error in
            actualData = data
            actualError = error
        }
        let testData = try? JSONSerialization.data(withJSONObject: jsonObject)
        if let testData = testData {
            NYCHighSchoolsDataParser().parseData(data: testData, completion: completion)
        } else {
            XCTFail("Invalid test data")
        }
        XCTAssertNil(actualData)
        XCTAssertNotNil(actualError)
    }
}
