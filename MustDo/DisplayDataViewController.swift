//
//  DisplayDataViewController.swift
//  
//
//  Created by Praveen on 2017-07-10.
//
//

import UIKit
import CoreData

protocol editedDelegate {
    
    func didEditText()
}

class DisplayDataViewController: UIViewController,UITextViewDelegate{
    
    var notes = [NSManagedObject]()
    
    var editedData:Notes!

    var delegate : editedDelegate!
    
    @IBOutlet weak var myTextView: UITextView!
    var passedValue:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTextView.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DisplayDataViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let text = passedValue {
            myTextView.text = text
        }
    }
    @IBAction func editButton(_ sender: UIButton) {
        
        myTextView.isUserInteractionEnabled = true
        myTextView.becomeFirstResponder()
    }
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        let detail = self.myTextView
        
        var editText = ""
        editText = myTextView.text!
        
        self.editedData.myNotes = editText
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.saveContext()
         delegate.didEditText()
        self.navigationController?.popViewController(animated: true)
        
        

    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }

        // Do any additional setup after loading the view.


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
