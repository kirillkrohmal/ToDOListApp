//
//  ToDoEntity+CoreDataProperties.swift
//  ToDOList
//
//  Created by kirill on 22.07.2025.
//
//

import Foundation
import CoreData


extension ToDoEntity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoEntity> {
        return NSFetchRequest<ToDoEntity>(entityName: "ToDoEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var isDone: Bool
    @NSManaged public var title: String?

}

extension ToDoEntity : Identifiable {

}
