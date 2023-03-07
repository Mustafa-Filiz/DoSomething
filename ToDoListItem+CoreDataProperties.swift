//
//  ToDoListItem+CoreDataProperties.swift
//  DoSomething
//
//  Created by Mustafa Filiz on 3.03.2023.
//
//

import Foundation
import CoreData


extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var note: String?
    @NSManaged public var todo: String?

}

extension ToDoListItem : Identifiable {

}
