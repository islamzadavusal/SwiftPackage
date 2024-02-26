//
//  ViewController.swift
//  SwiftPackage
//
//  Created by Vusal Islamzada on 26.02.24.
//

import UIKit
import SnapKit
import RealmSwift

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtTitle: UITextField!
    
    @IBOutlet weak var txtDescribe: UITextField!
    
    let viewModel = ViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        configureButton()
        
        let fileUrl = Realm.Configuration.defaultConfiguration.fileURL
        print(fileUrl?.absoluteString)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        let noteEntity = NoteEntity()
        
        noteEntity.title = txtTitle.text ?? ""
        noteEntity.describe = txtDescribe.text ?? ""
        
        viewModel.insertNoteList(note: noteEntity)
        
        let items = viewModel.readAllData() 
        
        refreshTable()
    }
    
    func refreshTable(){
        // table reload
    }
    
//    func configureButton(){
//        let lbl = UILabel()
//        lbl.text = "Selam"
//        lbl.backgroundColor = UIColor.red
//        
//        
//        //        let btn = UIButton(type: .custom)
//        
//        self.view.addSubview(lbl)
//        
//        //
//        //        btn.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
//        
//        lbl.snp.makeConstraints { make in
//            
//            //            make.centerX.equalTo(self.view.snp.centerX)
//            
//            //            make.centerX.equalToSuperview()
//            //            make.centerY.equalToSuperview()
//            
//            //            make.trailing -> sag
//            //            make.leading -> sol
//            
//            make.top.equalToSuperview().offset(50)
//            make.leading.equalToSuperview().offset(20)
//            make.trailing.equalToSuperview().offset(-20)
//            make.height.width.equalTo(50)
//            
//        }
//        
//        let lbl2 = UILabel()
//        
//        lbl2.text = "Selam - 2"
//        lbl2.backgroundColor = UIColor.green
//        
//        
//        self.view.addSubview(lbl2)
//        
//        lbl2.snp.makeConstraints { make in
//            
//            make.top.equalTo(lbl.snp.bottom).offset(50)
//            make.leading.equalToSuperview().offset(20)
//            make.trailing.equalToSuperview().offset(-20)
//            make.height.width.equalTo(50)
//        }
//        
//    }
    
}
