//
//  NoteEntity.swift
//  SwiftPackage
//
//  Created by Vusal Islamzada on 26.02.24.
//

import UIKit
import Realm
import RealmSwift

class NoteEntity: Object {

    @objc dynamic var id : String = UUID().uuidString
    @objc dynamic var title : String = ""
    @objc dynamic var describe : String = ""
    @objc dynamic var isFav : Bool = false
    @objc dynamic var date : Date = Date()
    
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
