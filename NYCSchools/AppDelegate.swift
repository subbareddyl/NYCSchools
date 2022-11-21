//
//  AppDelegate.swift
//  NYCSchools
//
//  Created by Subbareddy l on 11/19/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        let highSchoolsService = NYCHighSchoolsService(urlString: Config.highSchoolsServiceURLString)
        let SATScoresService = NYCHighSchoolsService(urlString: Config.satScoresServiceURLString)
        let schoolsListVC = NYCSchoolsListViewController(highSchoolsService: highSchoolsService, satScoresService: SATScoresService)
        self.window?.rootViewController = UINavigationController(rootViewController: schoolsListVC)
        self.window?.makeKeyAndVisible()
        return true
    }
}

