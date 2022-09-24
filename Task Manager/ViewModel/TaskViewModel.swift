//
//  TaskViewModel.swift
//  Task Manager
//
//  Created by Vladislav Tereshchenko on 23.05.2022.
//

import SwiftUI
import CoreData

class TaskViewModel: ObservableObject {
    @Published var currentTab: String = "Today"
    @Published var openEditTask: Bool = false
    @Published var taskTitle: String = ""
    @Published var taskColor: String = "Blue"
    @Published var taskDeadLine: Date = Date()
    @Published var taskType: String = "Basic"
    @Published var showDatePicker: Bool = false
    @Published var editTask: Task?
    
    func createNewTask(context: NSManagedObjectContext)->Bool {
        var task: Task!
        if let editTask = editTask {
            task = editTask
        } else {
            task = Task(context: context)
        }
        task.title = taskTitle
        task.color = taskColor
        task.deadline = taskDeadLine
        task.type = taskType
        task.isCompleted = false
        
        if let _ = try? context.save() {
            return true
        }
        return false
    }
    
    func resetTaskData() {
        taskType = "Basic"
        taskTitle = ""
        taskColor = "Blue"
        taskDeadLine = Date()
    }
    
    func setupTask() {
        if let editTask = editTask {
            taskType = editTask.type ?? "Basic"
            taskTitle = editTask.title ?? ""
            taskColor = editTask.color ?? "Blue"
            taskDeadLine = editTask.deadline ?? Date()
        }
    }
}
