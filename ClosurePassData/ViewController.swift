//
//  ViewController.swift
//  ClosurePassData
//
//  Created by Abouzar Moradian on 9/11/24.
//

import UIKit

class ViewController: UIViewController {

    var secondScreen: SecondScreenVC?
    @IBOutlet weak var inputTextTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func nextButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        secondScreen = storyboard.instantiateViewController(withIdentifier: "SecondScreenVC") as? SecondScreenVC
        if let secondScreen = secondScreen {
            
            if let text = inputTextTF.text{
                secondScreen.inputText = text
            }
            
            secondScreen.dataClosure = { [weak self] returnedData in
                self?.inputTextTF.text = returnedData
            }
            navigationController?.pushViewController(secondScreen, animated: true)
        }
    }
    
}

