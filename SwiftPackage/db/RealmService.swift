//
//  RealmService.swift
//  SwiftPackage
//
//  Created by Vusal Islamzada on 26.02.24.
//

import UIKit
import Realm
import RealmSwift



protocol RealmServiceType {
    
    func getAllNotes() -> [NoteEntity]?
    func insertNote(noteEntity: NoteEntity)
    func deleteNote(noteId : String)
    func updateNote(noteId: String, title: String)
}

class RealmService: RealmServiceType {
 
    
    func getAllNotes() -> [NoteEntity]? {
        
//        let configuration = Realm.Configuration(schemaVersion: 1)
//        let realm = try! Realm(configuration: configuration)
        
//        let realm = try! Realm()
//        if let noteList = realm.objects(NoteEntity.self).first {
//            return []
//        }
//      return []
//    }
        
        let realm = try! Realm()
        var noteList = [NoteEntity]()
        realm.objects(NoteEntity.self).forEach { noteEntity in
            noteList.append(noteEntity)
        }
        
      return noteList
    }
    
    func insertNote(noteEntity: NoteEntity) {
        let realm = try! Realm()
        try? realm.write {
            realm.add(noteEntity)
        }
    }
    
    func deleteNote(noteId: String) {
        let realm = try! Realm()
        try? realm.write{
            let deletedNote = realm.objects(NoteEntity.self).filter ("id == %@", noteId)
            
            // int = %i
            // string = %@
          
            realm.delete(deletedNote)
        }
    }
    
    func updateNote(noteId: String, title: String) {
        let realm = try! Realm()
        try? realm.write{
           if let updateNote = realm.objects(NoteEntity.self).filter ("id == %@", noteId).first {
                updateNote.title = title
            }
           
        }
        
//        let vm = ViewControllerViewModel(realmService: MockRealmService())
    }

}


/*class MockRealmService : RealmServiceType {
    
    var dbList = [NoteEntity]()
    
    func getAllNotes() -> [NoteEntity]? {
        
    }
    
    func insertNote(noteEntity: NoteEntity) {
        dbList.append(noteEntity)
    }
    
    func deleteNote(noteId: String) {
        
    }
    
    func updateNote(noteId: String, title: String) {
        
    }
    
    
}*/
