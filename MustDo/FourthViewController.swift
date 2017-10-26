//
//  FourthViewController.swift
//  MustDo
//
//  Created by Praveen on 2017-05-16.
//  Copyright © 2017 Praveen. All rights reserved.
//

import UIKit
import CoreData

@available(iOS 10.0, *)
class FourthViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIPopoverPresentationControllerDelegate,editedDelegate {
    
static var context: NSManagedObjectContext!
    var valueToPass:String!
    
    var selectedNotes:Notes!
    @IBOutlet weak var tableView: UITableView!
    var notes = [Notes]()
    override func viewDidLoad() {
        super.viewDidLoad()
         
         self.navigationItem.title = "List of Plans"
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let request: NSFetchRequest<NSFetchRequestResult> = Notes.fetchRequest()
//        
//        do {
//            let fetchedNotes = try context.fetch(request) as! [Notes]
//        } catch {
//            fatalError("Failed to fetch Notes: \(error)")
//        }
        
      self.getNotes()

        // Do any additional setup after loading the view.
    }
    
    func getNotes(){
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Notes")
        
        //  let predocate = NSPredicate(format: "", nil)
        
        
        do {
            let list = try managedContext?.fetch(fetchRequest)
            print(list!)
            self.notes = list as! [Notes]
            //            dataView.text = listOfUsers
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }

        self.tableView.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifer")
        
        if cell == nil {
            
            cell = UITableViewCell(style: .default, reuseIdentifier: "CellIdentifer")
        }
        let userData = self.notes[indexPath.row]
        cell?.textLabel?.text = userData.myNotes
        return cell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete{
            let user = notes[indexPath.row]
            context.delete(user)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            notes.remove(at: indexPath.row)
            self.tableView.reloadData()

            }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 70
    }
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        
        
        let userData = self.notes[indexPath.row]
        valueToPass = userData.myNotes
        self.selectedNotes = userData
        performSegue(withIdentifier: "showDetail", sender: self)
        
        
            }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            
        if (segue.identifier == "showDetail") {
            // initialize new view controller and cast it as your view controller
            var viewController = segue.destination as! DisplayDataViewController
            // your new view controller should have property that will store passed value
            viewController.passedValue = valueToPass
            viewController.editedData = self.selectedNotes
            viewController.delegate = self
            
            
        }
        }
    
    func didEditText() {
        self.getNotes()
    }
        
        }





