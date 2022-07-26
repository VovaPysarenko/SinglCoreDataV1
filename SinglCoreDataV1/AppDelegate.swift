//
//  AppDelegate.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 06.12.2021.
//

import UIKit
import CoreData
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coreData = CoreData()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainVC = StartViewController()
        let navigationController = UINavigationController.init(rootViewController: mainVC)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
//        print("file", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last ?? "")
//        mainVC.context = coreData.persistentContainer.viewContext
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
      // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
      // Saves changes in the application's managed object context before the application terminates.
      coreData.saveContext()
    }
}

