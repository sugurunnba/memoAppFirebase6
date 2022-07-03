//
//  AddViewController.swift
//  memoAppFirebase6
//
//  Created by 高木克 on 2022/07/03.
//


import UIKit
import Firebase


class AddViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var textText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        self.saveButton.isEnabled = false
        updateSaveButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.saveButton.isEnabled = false
//        updateSaveButton()
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        let data = Firestore.firestore().collection("memos")
        data.addDocument(data: [
            "name": nameText.text!,
            "text": textText.text!
        ]) { error in
            if let error = error {
                print("ドキュメントの追加に失敗しました:", error)
            }
        }

        self.navigationController?.popViewController(animated: true)
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
