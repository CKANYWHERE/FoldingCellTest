//
//  AppDelegate.swift
//  Test_FoldingCell
//
//  Created by 민창경 on 2020/12/01.
//

import UIKit
import SnapKit
import Then

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TestTableController()
        window?.makeKeyAndVisible()
        return true
    }
}

