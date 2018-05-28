//
//  RecipeViewController.swift
//  mobileTest_sm
//
//  Created by Shane McCully on 27/05/2018.
//  Copyright © 2018 Shane McCully. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    final let url = URL(string:"http://food2fork.com/api/search?key=bd821c89e475f5200c40d25af24a835b") // API Key
    private  var recipes = [Recipe]()
   
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        downloadJSON() // MARK: -  UIImage resizing issue
    }
    
    func downloadJSON(){
        
        guard let downloadUrl = url else { return } // MARK: - Make sure optional URL != nil
        URLSession.shared.dataTask(with: downloadUrl) { (data, urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("issue") // MARK: - make request to get recipes from API
                return
            }
            print(data.count)
            print("downloaded") // Information from URL
            
            do{
                let decoder = JSONDecoder()
                let downloadedRecipies = try decoder.decode(Recipes.self, from: data) // Parse
                self.recipes = downloadedRecipies.recipes
                DispatchQueue.main.async { // MARK: - threading issue 
                    self.tableView.reloadData() // update UI
                }
            }catch{
                print("JSONDecoding Error")
            }
            }.resume() // Continous
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"RecipeCell") as? RecipeCell else { return UITableViewCell() }
        
        cell.titleLabel.text = recipes[indexPath.row].title
        cell.publisherLabel.text = recipes[indexPath.row].publisher
        
        if let imageURL = URL(string: recipes[indexPath.row].image_url){ 
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        
                        cell.imgView.image = image
                    }
                }
            }
        }
        return cell
    }
}

