//
//  AppCategory.swift
//  OldAppStore
//
//  Created by Руслан Акберов on 05.05.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import Foundation

class AppCategory: NSObject {
    var name: String?
    var apps: [App]?
    var type: String?
    
    static func fetchFeaturedApps(completion: @escaping ([AppCategory]) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/featured"
        let session = URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                var appCategories = [AppCategory]()
//                for dict in json["categories"] as [String: [AnyObject]] {
//                    let appCategory = AppCategory()
//                    appCategory.setValuesForKeys(dict as! [String : AnyObject])
//                    appCategories.append(appCategory)
//                }
                DispatchQueue.main.async {
                    completion(appCategories)
                }
            } catch let error{
                print(error.localizedDescription)
            }
        }
        session.resume()
    }
    
    static func sampleAppCategories() -> [AppCategory] {
        let bestNewGamesCategory = AppCategory()
        bestNewGamesCategory.name = "Best New Games"
        let battletoadsApp = App()
        battletoadsApp.name = "Battletoads And Double Dragon"
        battletoadsApp.imageName = "BT"
        battletoadsApp.category = "Games"
        battletoadsApp.price = 3.99
        var gamesApps = [App]()
        gamesApps.append(battletoadsApp)
        bestNewGamesCategory.apps = gamesApps
        
        let bestNewMusicCategory = AppCategory()
        bestNewMusicCategory.name = "Best Music Apps"
        let guitarApp = App()
        guitarApp.name = "Guitar lessons"
        guitarApp.imageName = "guitar"
        guitarApp.category = "Music"
        guitarApp.price = 1.99
        var musicApps = [App]()
        musicApps.append(guitarApp)
        bestNewMusicCategory.apps = musicApps
        
        return [bestNewGamesCategory, bestNewMusicCategory]
    }
}










