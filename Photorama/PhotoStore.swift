//
//  PhotoStore.swift
//  Photorama
//
//  Created by Rodrigo Villatoro on 3/22/16.
//  Copyright © 2016 Rodrigo Villatoro. All rights reserved.
//

import Foundation

class PhotoStore {
    
    let session: NSURLSession = {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        return NSURLSession(configuration: config)
    }()
    
    func processRecentPhotosRequest(data data: NSData?, error: NSError?) -> PhotosResult {
        
        guard let jsonData = data else {
            return .Failure(error!)
        }
        
        return FlickrAPI.photosFromJSONData(jsonData)
        
    }
    
    func fetchRecentPhotos(completion completion: (PhotosResult) -> Void) {
        let url = FlickrAPI.recentPhotosURL()
        let request = NSURLRequest(URL: url)
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            
            let result = self.processRecentPhotosRequest(data: data, error: error)
            completion(result)
            
            
        }
        task.resume()
    }
    
    
    
}