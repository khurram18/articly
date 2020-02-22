//
//  cleanup.swift
//  Articly
//
//  Created by Khurram on 23/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import BackgroundTasks
import CoreData
import Foundation
  
func cleanup(task: BGTask, persistentContainer: NSPersistentContainer) {
  defer {
    task.setTaskCompleted(success: true)
  }
  task.expirationHandler = {}
  let persistence = CoreDataPersistence(persistentContainer: persistentContainer)
  guard let pastDate = Date.getPastDate() else { return }
  persistence.deleteOlder(then: pastDate)
}
