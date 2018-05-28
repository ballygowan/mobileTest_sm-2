//
//  Recipe.swift
//  mobileTest_sm
//
//  Created by Shane McCully on 27/05/2018.
//  Copyright © 2018 Shane McCully. All rights reserved.
//

import UIKit

// MARK: - Model for recipes data

class Recipes: Decodable { // conform to JSONDecoder() protocol
    let recipes: [Recipe] 
    
    init(recipes: [Recipe]) {
        self.recipes = recipes
    }
}

// MARK: - Model for recipe data

class Recipe: Decodable { // conform to JSONDecoder() protocol
    
    let publisher:String
    let f2f_url:String
    let title:String
    let source_url:String
    let recipe_id:String
    let image_url:String
    let social_rank:Double
    let publisher_url:String
    
    init(publisher:String, f2f_url:String, title:String, source_url:String, recipe_id:String, image_url:String, social_rank:Double, publisher_url:String ) {
        
        self.publisher = publisher
        self.f2f_url = f2f_url
        self.title = title
        self.source_url = source_url
        self.recipe_id = recipe_id
        self.image_url = image_url
        self.social_rank = social_rank
        self.publisher_url = publisher_url
    }
    
}
