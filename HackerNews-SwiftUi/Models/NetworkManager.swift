//
//  NetworkManager.swift
//  HackerNews-SwiftUi
//
//  Created by Csongor Keller on 03/11/2020.
//

import Foundation
import CoreData

class NetworkManager: ObservableObject  {
    
   @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(PostData.self, from: safeData)
                            
                            DispatchQueue.main.async {
                                self.posts = results.hits!
                            }
                        } catch  {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
