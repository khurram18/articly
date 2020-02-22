//
//  AppDelegate.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import BackgroundTasks
import UIKit
import CoreData

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
  
private let cleanupTaskIdentifier = "com.example.Articly.db_cleanup"
  
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  if !isTestEnvironment {
    registerCleanupTask()
  }
  return true
}

  // MARK: UISceneSession Lifecycle

func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
  UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
}

// MARK: - Core Data stack

lazy var persistentContainer: NSPersistentContainer = {
    /*
     The persistent container for the application. This implementation
     creates and returns a container, having loaded the store for the
     application to it. This property is optional since there are legitimate
     error conditions that could cause the creation of the store to fail.
    */
  let container = NSPersistentContainer(name: "Articly")
  container.loadPersistentStores(completionHandler: { (storeDescription, error) in
    if let error = error as NSError? {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
             
            /*
             Typical reasons for an error here include:
             * The parent directory does not exist, cannot be created, or disallows writing.
             * The persistent store is not accessible, due to permissions or data protection when the device is locked.
             * The device is out of space.
             * The store could not be migrated to the current model version.
             Check the error message to determine what the actual problem was.
             */
      fatalError("Unresolved error \(error), \(error.userInfo)")
    }
  })
  return container
}()

// MARK: - Core Data Saving support

func saveContext () {
  let context = persistentContainer.viewContext
  if context.hasChanges {
    do {
      try context.save()
    } catch {
      // Replace this implementation with code to handle the error appropriately.
      // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
      let nserror = error as NSError
      fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    }
  }
}

} // class AppDelegate

private let taskRegisteredKey = "taskRegistered.com.example.Articly"

extension AppDelegate {
  
static var instance: AppDelegate {
  UIApplication.shared.delegate as! AppDelegate
}

private func registerCleanupTask() {
  
  if !UserDefaults.standard.bool(forKey: taskRegisteredKey) {
    BGTaskScheduler.shared.register(forTaskWithIdentifier: cleanupTaskIdentifier, using: nil) { task in
      self.cleanup(task)
    }
    UserDefaults.standard.set(true, forKey: taskRegisteredKey)
  }
  try? BGTaskScheduler.shared.submit(BGProcessingTaskRequest(identifier: cleanupTaskIdentifier))
}
  
private func cleanup(_ task: BGTask) {
  let persistence = CoreDataPersistence(persistentContainer: persistentContainer)
  
  
}
  
private var isTestEnvironment: Bool {
#if DEBUG
  return ProcessInfo.processInfo.environment.keys.contains("XCTestConfigurationFilePath") ||
    ProcessInfo.processInfo.arguments.contains("UITests") ||
    NSClassFromString("XCTest") != nil
#else
  return false
#endif
}
  
} // extension AppDelegate

private func getPastDate() -> Date? {
  let date = Date()
  let calendar = Calendar.current
  var dateComponents = calendar.dateComponents([.day, .month, .year], from: date)
  dateComponents.setValue((dateComponents.day ?? 0) - 7, for: .day)
  return dateComponents.date
}

