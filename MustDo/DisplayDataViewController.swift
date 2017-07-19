//
//  DisplayDataViewController.swift
//  
//
//  Created by Praveen on 2017-07-10.
//
//

import UIKit
import CoreData

class DisplayDataViewController: UIViewController {

    
    @IBOutlet weak var myTextView: UITextView!
    var text:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let text = text {
            myTextView.text = text
        }
    }
    @IBAction func editButton(_ sender: UIButton) {
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
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
