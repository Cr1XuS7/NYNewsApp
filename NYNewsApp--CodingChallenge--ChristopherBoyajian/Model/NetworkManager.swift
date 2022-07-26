//
//  NetworkManager.swift
//  NYNewsApp--CodingChallenge--ChristopherBoyajian
//
//  Created by Christopher Boyajian on 22/07/2022.
//

import Foundation

struct Parser {
    
    func parse(comp : @escaping ([Results]) -> ()){
        let api = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=oUS8cPvN2sAGnDuZYcTGUtO4GzAMmK91#")
        
        URLSession.shared.dataTask(with: api!) {
            data , response , error  in
            if error != nil {
                print (error?.localizedDescription)
                return
            }
            do{
          let decodedData = try JSONDecoder().decode(Root.self, from: data!)
                comp(decodedData.results)
            }catch {
                
            }
        }.resume()
    }
    
}
