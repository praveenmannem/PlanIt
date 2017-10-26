//
//  Notes+CoreDataProperties.swift
//  MustDo
//
//  Created by Praveen on 2017-05-18.
//  Copyright © 2017 Praveen. All rights reserved.
//

import Foundation
import CoreData


extension Notes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notes> {
        return NSFetchRequest<Notes>(entityName: "Notes")
    }

    @NSManaged public var myNotes: String?

}
