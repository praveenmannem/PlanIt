//
//  ThirdViewController.swift
//  MustDo
//
//  Created by Praveen on 2017-05-16.
//  Copyright © 2017 Praveen. All rights reserved.
//

import UIKit
import CoreData

class ThirdViewController: UIViewController,UITextViewDelegate {
    
  let namesArray = NSArray()
  let saveButton = UIButton()
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Create a Plan"
        
        // Do any additional setup after loading the view.
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func saveButton(_ sender: UIButton) {
        saveButton.layer.cornerRadius = 20
        saveButton.layer.borderWidth = 1
        saveButton.clipsToBounds = true
        
        if textView?.text != "" {
          
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managesObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Notes")
        let notes = Notes(context:managesObjectContext)
        
        notes.myNotes = self.textView.text
        managesObjectContext.insert(notes)
        appDelegate.saveContext()
            let alert = UIAlertController(title: "Good", message: "Your plan is saved", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "ALERT", message: "Please enter a plan", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
//        //Instance of appdelegate
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        
//        //saving the data
//        (UIApplication.shared.delegate as! AppDelegate).saveContext()
//        
//        //to insert a new object
//        let entity=NSEntityDescription.insertNewObject(forEntityName: "Notes", into: context) as! Notes
//        
//        entity.myNotes=self.textView.text
//        do {
//            try managedObjectContext.save()
//        } catch {
//            fatalError("Failure to save context: \(error)")
//        }
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
