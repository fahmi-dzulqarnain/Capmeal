//
//  CoreDataViewModel.swift
//  Capmeal
//
//  Created by Fahmi Dzulqarnain on 22/07/21.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    
    @Published var journalData:[JournalEntity] = []
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "CapmealModel")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Yah, Core Data nya error nih! \(error)")
            }
        }
    }
    
    func fetchJournal(){
        do {
            journalData = try container.viewContext.fetch(NSFetchRequest<JournalEntity>(entityName: "JournalEntity"))
        } catch let error {
            print("Error nih pas ngambil data jurnalnya, nih detailnya \(error)")
        }
    }
    
    func addJournal(idMeal: String, lagiApa: String, perasaan: String, porsi: Double,
                    satuan: String, tanggalJam: Date, tipe: String){
        let newJournal = JournalEntity(context: container.viewContext)
        newJournal.id_meal = idMeal
        newJournal.lagi_apa = lagiApa
        newJournal.perasaan = perasaan
        newJournal.porsi = porsi
        newJournal.satuan = satuan
        newJournal.tanggal_jam = tanggalJam
        newJournal.tipe = tipe
        saveData()
    }
    
    func updateJournal(journal: JournalEntity, lagiApa: String, perasaan: String, porsi: Double,
                       satuan: String, tanggalJam: Date, tipe: String){
        journal.lagi_apa = lagiApa
        journal.perasaan = perasaan
        journal.porsi = porsi
        journal.satuan = satuan
        journal.tanggal_jam = tanggalJam
        journal.tipe = tipe
        saveData()
    }
    
    func deleteJournal(journal: JournalEntity){
        container.viewContext.delete(journal)
        saveData()
    }
    
    func saveData(){
        do {
            try container.viewContext.save()
        } catch let error {
            print("Ada masalah pas nyimpan data \(error)")
        }
    }
}
