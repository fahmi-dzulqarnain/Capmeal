//
//  MealEntity+CoreDataProperties.swift
//  Capmeal
//
//  Created by Edwin Niwarlangga on 23/07/21.
//
//

import Foundation
import CoreData


extension MealEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MealEntity> {
        return NSFetchRequest<MealEntity>(entityName: "MealEntity")
    }

    @NSManaged public var deskripsi: String?
    @NSManaged public var gambar: Data?
    @NSManaged public var id_meal: String?
    @NSManaged public var kalori: Int32
    @NSManaged public var karbohidrat: Int32
    @NSManaged public var lemak: Int32
    @NSManaged public var nama: String?
    @NSManaged public var protein: Int32

}

extension MealEntity : Identifiable {

}
