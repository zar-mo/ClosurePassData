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

// MARK: using closure and using delegate for passing data are very similar and in fact follow the same logic. the idea is that you define the signiture of a function in the child view and force the parent view to implement it. then in the child view you call this optional function (method) and pass data in it. in parent view we can access the passed data and do whatever we want with it.

/*
 child view:   delegate: ((String) -> ())?
               delegate?("abc", "xyz")
 
 parent view:  childView.delegate = {(String, String) -> () in [body of closure]}
 */

/*
child view:   delegate: DelegateProtocol?
              delegate?.method("abc", "xyz")
 
 parent view:   childView.delegate = self
                delegateFunc(String, String) -> (){ [body of method]}
 
 */
