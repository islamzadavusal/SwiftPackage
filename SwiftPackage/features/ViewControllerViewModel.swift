//
//  ViewControllerViewModel.swift
//  SwiftPackage
//
//  Created by Vusal Islamzada on 26.02.24.
//

import UIKit

protocol ViewControllerViewModelProtocol {
    func insertNoteList(note: NoteEntity)
}

class ViewControllerViewModel : ViewControllerViewModelProtocol {
    
    let realmService : RealmServiceType
    
    init(realmService: RealmServiceType = RealmService()) {
        self.realmService = realmService
    }
    
    func insertNoteList(note: NoteEntity) {
        realmService.insertNote(noteEntity: note)
    }
    
    func readAllData() -> [NoteEntity] {
        return realmService.getAllNotes() ?? []
    }
    
    
}
