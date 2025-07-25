//
//  ToDoEntity+CoreDataProperties.swift
//  ToDOList
//
//  Created by Kirill on 25.07.2025.
//
//

import Foundation
import CoreData


extension ToDoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoEntity> {
        return NSFetchRequest<ToDoEntity>(entityName: "ToDoEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var completed: Bool
    @NSManaged public var userId: UUID?
    @NSManaged public var todo: String?

}

extension ToDoEntity : Identifiable {

}
