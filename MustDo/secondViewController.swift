//
//  secondViewController.swift
//  MustDo
//
//  Created by Praveen on 2017-05-11.
//  Copyright © 2017 Praveen. All rights reserved.
//

import UIKit
import CoreData



class secondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func writeButton(_ sender: UIButton) {
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let thirdvc : ThirdViewController = (storyboard .instantiateViewController(withIdentifier: "third") as? ThirdViewController)!
        self.navigationController?.pushViewController(thirdvc, animated: true)
    }
    @IBAction func listButton(_ sender: UIButton) {
        
        
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let fourthvc : FourthViewController = (storyboard .instantiateViewController(withIdentifier: "fourth") as? FourthViewController)!
        self.navigationController?.pushViewController(fourthvc, animated: true)
        
               
    }
    
    @IBAction func homeButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
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
