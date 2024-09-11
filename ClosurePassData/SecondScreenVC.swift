//
//  SecondScreenVC.swift
//  ClosurePassData
//
//  Created by Abouzar Moradian on 9/11/24.
//

import UIKit

class SecondScreenVC: UIViewController {

    @IBOutlet weak var inputTextTF: UITextField!
    var inputText: String = ""
    var dataClosure: ((String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextTF.text = inputText

    }

    @IBAction func backButton(_ sender: UIButton) {
        
        if let text = inputTextTF.text{
            dataClosure?(text)
        }
        navigationController?.popViewController(animated: true)
    }
    
}
