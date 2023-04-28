//
//  NetworkManager.swift
//  MultithreadingTest
//
//  Created by Арсений Кухарев on 28.04.2023.
//

import UIKit

class NetworkManager {
    
    func getImage(completion: @escaping (UIImage) -> Void) {
    
        let url = URL(string: "https://loremflickr.com/320/240")

        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else { return }
       
            print("Task closure")
            completion(UIImage(data: data!)!)
        }
        task.resume()
        print("getImageFunc")
    }
    
    
    
}

