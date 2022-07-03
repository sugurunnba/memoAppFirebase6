//
//  EditViewController.swift
//  memoAppFirebase6
//
//  Created by 高木克 on 2022/07/03.
//

import UIKit
import Firebase

class EditViewController: UIViewController {
    var memo: Memo?

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var textText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let memo = memo{
            self.nameText.text = memo.name
            self.textText.text = memo.text
        }
        self.saveButton.isEnabled = false
        updateSaveButton()
        
        self.saveButton.setTitle("変更する", for: .normal)
    }

    @IBAction func submitButtonTapped(_ sender: Any) {
        let data = Firestore.firestore().collection("memos").document(memo?.documentId ?? "")
        data.updateData([
            "name": nameText.text!,
            "text": textText.text!
        ]) { error in
            if let error = error {
                print("ドキュメントの更新に失敗しました:", error)
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nameTextField(_ sender: Any) {
        updateSaveButton()
    }
    
    @IBAction func textTextField(_ sender: Any) {
        updateSaveButton()
    }
    
    private func updateSaveButton(){
        let nameTextStates = self.nameText.text ?? ""
        let textTextStates = self.textText.text ?? ""
        if(nameTextStates.isEmpty || textTextStates.isEmpty){
            self.saveButton.isEnabled = false
        } else {
            self.saveButton.isEnabled = true
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
