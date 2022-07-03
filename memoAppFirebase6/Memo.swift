//
//  Memo.swift
//  memoAppFirebase6
//
//  Created by 高木克 on 2022/07/03.
//

import UIKit
import Firebase

struct Memo {
    var name: String = ""
    var text: String = ""
    var documentId: String = ""
    
    init(dic: [String: Any], documentId: String){
         self.name = dic["name"] as! String
         self.text = dic["text"] as! String
         self.documentId = documentId
    }
}
