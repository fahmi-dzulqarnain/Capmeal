//
//  JournalEntity+CoreDataProperties.swift
//  Capmeal
//
//  Created by Edwin Niwarlangga on 23/07/21.
//
//

import Foundation
import CoreData


extension JournalEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JournalEntity> {
        return NSFetchRequest<JournalEntity>(entityName: "JournalEntity")
    }

    @NSManaged public var id_meal: String?
    @NSManaged public var lagi_apa: String?
    @NSManaged public var perasaan: String?
    @NSManaged public var porsi: Double
    @NSManaged public var satuan: String?
    @NSManaged public var tanggal_jam: Date?
    @NSManaged public var tipe: String?

}

extension JournalEntity : Identifiable {

}
