//
//  ViewController.swift
//  AssignmentAntino
//
//  Created by Naman Sharma on 28/12/19.
//  Copyright © 2019 Naman Sharma. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var listData : [parsedDataModel] = [parsedDataModel]()
    let givenUrl = "http://demo8716682.mockable.io/cardData"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData(url: givenUrl)
        
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! reusableCell
        cell.nameText.text = listData[indexPath.row].name
        cell.ageText.text = listData[indexPath.row].age
        cell.locationText.text = listData[indexPath.row].location
//        cell.personImage.image  = #imageLiteral(resourceName: "sample")
        let url = listData[indexPath.row].url
        cell.personImage.makeRounded()
        Alamofire.request(url)
          .response { response in
            guard let imageData = response.data else {
              print("Could not get image")
              return
            }
            cell.personImage.image = UIImage(data: imageData)
        }


        return cell
    }
    
    
    func getData(url: String) {

        Alamofire.request(url, method: .get, parameters: nil).responseJSON {
            response in
            if response.result.isSuccess {
                
                let linkJSON : JSON = JSON(response.result.value!)
                
                for value in 0..<5{
                    let result = parsedDataModel()
                    result.name = linkJSON[value]["name"].string ?? "N.A"
                    result.age = linkJSON[value]["age"].string ?? "N.A"
                    result.location = linkJSON[value]["location"].string ?? "N.A"
                    result.url = linkJSON[value]["url"].string ?? "N.A"
                    self.listData.append(result)
                }
                self.tableView.reloadData()
            }
            else {
                print("Error \(String(describing: response.result.error))")
            }
        }
        
    }

}

extension UIImageView {

    func makeRounded() {

        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
