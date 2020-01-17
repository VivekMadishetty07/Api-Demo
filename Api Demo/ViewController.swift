//
//  ViewController.swift
//  Api Demo
//
//  Created by Vivek Madishetty on 2020-01-17.
//  Copyright © 2020 Vivek Madishetty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityTxt: UITextField!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    @IBAction func selectCity(_ sender: UIButton) {
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(cityTxt.text!)&APPID=5504bdd58de3e2759e1f624faaa1491e")!
                
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print(error)
                    } else {
                        if let urlContent = data {
                            do{
                                let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                                print(jsonResult!)
                            //    print(jsonResult["name"] as! String)
                                if let description = ((jsonResult?["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                                    print(description)
                                    DispatchQueue.main.async {
                                        self.infoLabel.text = description
                                    }
                                }
                            } catch {
                                print(error)
                                
                            }
                    }
            }


        }
                // start the task
                task.resume()

        }
    



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
}
    

}
