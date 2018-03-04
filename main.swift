//
//  main.swift
//  JSONGenerator
//
//  Created by Carson Marr on 3/1/18.
//  Copyright © 2018 Carson Marr. All rights reserved.
//

import Foundation

var recipeDict: NSDictionary?
if let url = Bundle.main.url(forResource: "WBSAutoFillQuirks", withExtension: "plist") {
    do {

        let data = try Data(contentsOf:url)
        let dict = try PropertyListSerialization.propertyList(from:data, options:[], format:nil) as! [String:Any]

        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
        let obj = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
       
        //if let str = (obj as! NSDictionary).value(forKey: "url") {
            let recipeDict = NSDictionary()
            //recDict.setValue(str, forKey: "")
            
        if let outputURL = Bundle.main.url(forResource: "password_recipe", withExtension: ".json"){
            print (outputURL.absoluteString)
            recipeDict.write(to: outputURL, atomically:true)
        }
       // }
        print(obj)
      
    } catch {
        print(error.localizedDescription)
    }
}


