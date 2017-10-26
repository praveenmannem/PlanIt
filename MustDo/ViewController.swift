//
//  ViewController.swift
//  MustDo
//
//  Created by Praveen on 2017-05-11.
//  Copyright © 2017 Praveen. All rights reserved.A 
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var gradientLayer: CAGradientLayer!

    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.darkGray.cgColor, UIColor.lightGray.cgColor]
        gradientLayer.frame = self.view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)*/
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func makeAPlan(_ sender: UIButton) {
        
        
        
        let mainStr: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let secondVC : secondViewController = (mainStr .instantiateViewController(withIdentifier: "second") as? secondViewController)!
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

}

