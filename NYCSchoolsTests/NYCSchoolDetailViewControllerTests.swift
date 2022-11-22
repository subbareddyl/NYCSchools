//
//  NYCSchoolDetailViewControllerTests.swift
//  NYCSchoolsTests
//
//  Created by Subbareddy l on 11/22/22.
//

import XCTest
@testable import NYCSchools

final class NYCSchoolDetailViewControllerTests: XCTestCase {
    
    func testNYCSchoolDetailViewControllerViews() throws {
        let school = School(dbn: "abc", school_name: "test", overview_paragraph: "test overview", neighborhood: "Fremont", location: nil, latitude: nil, longitude: nil, phone_number: "123", fax_number: nil, school_email: nil, website: nil, finalgrades: nil, subway: nil, bus: nil, directions1: nil, requirement1_1: nil, requirement2_1: nil, requirement3_1: nil, requirement4_1: nil, requirement5_1: nil, city: "Alameda")
        let SATScores = SATScores(dbn: "abc", school_name: "test", num_of_sat_test_takers: "100", sat_critical_reading_avg_score: "24", sat_math_avg_score: "21", sat_writing_avg_score: "20")
        let viewController = NYCSchoolDetailViewController(school: school, satScores: SATScores)
        let view = viewController.view
        let descriptionLabel = view?.findViewWithAccessibilityIdentifier(identifier: "description") as? UILabel
        XCTAssertEqual(descriptionLabel?.text, "test overview")
        let SATTestTakersLabel = view?.findViewWithAccessibilityIdentifier(identifier: "Number of SAT test takers:") as? UILabel
        XCTAssertEqual(SATTestTakersLabel?.text, "Number of SAT test takers:")
        let SATTestTakersDetailLabel = view?.findViewWithAccessibilityIdentifier(identifier: "Number of SAT test takers:-detail") as? UILabel
        XCTAssertEqual(SATTestTakersDetailLabel?.text, "100")
        // SAT writing avg score:
        let SATCriticalReadingAvgScore = view?.findViewWithAccessibilityIdentifier(identifier: "SAT critical reading avg score:") as? UILabel
        XCTAssertEqual(SATCriticalReadingAvgScore?.text, "SAT critical reading avg score:")
        let SATCriticalReadingAvgScoreDetail = view?.findViewWithAccessibilityIdentifier(identifier: "SAT critical reading avg score:-detail") as? UILabel
        XCTAssertEqual(SATCriticalReadingAvgScoreDetail?.text, "24")
        let SATMathAvgScore = view?.findViewWithAccessibilityIdentifier(identifier: "SAT match avg score:") as? UILabel
        XCTAssertEqual(SATMathAvgScore?.text, "SAT match avg score:")
        let SATMathAvgScoreDetail = view?.findViewWithAccessibilityIdentifier(identifier: "SAT match avg score:-detail") as? UILabel
        XCTAssertEqual(SATMathAvgScoreDetail?.text, "21")
        let SATWritingAvgScore = view?.findViewWithAccessibilityIdentifier(identifier: "SAT writing avg score:") as? UILabel
        XCTAssertEqual(SATWritingAvgScore?.text, "SAT writing avg score:")
        let SATWritingAvgScoreDetail = view?.findViewWithAccessibilityIdentifier(identifier: "SAT writing avg score:-detail") as? UILabel
        XCTAssertEqual(SATWritingAvgScoreDetail?.text, "20")
    }
}
