//
//  CacheManager.swift
//  youtube-onedaybuild
//
//  Created by Aizhan Tolebayeva on 28.12.2020.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?) {
        
        //store the image data and use the url as the key
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        //try to get the data for the specified url
        return cache[url]
    }
}
