//
//  SchoolCellTests.swift
//  NYCSchoolsTests
//
//  Created by Subbareddy l on 11/22/22.
//

import XCTest
@testable import NYCSchools

final class SchoolCellTests: XCTestCase {
    
    func testSchoolCellSubViews() throws {
        let cell = SchoolCell()
        let school = School(dbn: "abc", school_name: "Test name", overview_paragraph: "Test overview", neighborhood: "Fremont", location: nil, latitude: nil, longitude: nil, phone_number: nil, fax_number: nil, school_email: nil, website: nil, finalgrades: "6-10", subway: nil, bus: nil, directions1: nil, requirement1_1: nil, requirement2_1: nil, requirement3_1: nil, requirement4_1: nil, requirement5_1: nil, city: "Alameda")
        cell.updateModel(model: school)
        let schoolName = cell.findViewWithAccessibilityIdentifier(identifier: "school name") as? UILabel
        XCTAssertEqual(schoolName?.text, "Test name")
        let finalGrades = cell.findViewWithAccessibilityIdentifier(identifier: "final grades") as? UILabel
        XCTAssertEqual(finalGrades?.text, "6-10 Grades")
        let neighborhood = cell.findViewWithAccessibilityIdentifier(identifier: "neighborhood") as? UILabel
        XCTAssertEqual(neighborhood?.text, "Fremont, Alameda")
    }
}
