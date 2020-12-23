//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Aizhan Tolebayeva on 20.12.2020.
//

import Foundation

class Model {
    
    func getVideos(){
        
        //Create a URl object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //Get a urlsession object
        
        let session = URLSession.shared
        
        //gegt a data task
        let dataTask = session.dataTask(with: url!) {(data, response, error) in
        
            
            //check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            do {
            //parsing the data into video objects
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let response = try decoder.decode(Response.self, from: data!)
                dump(response)
            }
            catch{
                
            }
        
        }
        // kick off the task
        dataTask.resume()
    }
}
