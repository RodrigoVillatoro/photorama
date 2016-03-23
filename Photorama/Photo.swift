//
//  Photo.swift
//  Photorama
//
//  Created by Rodrigo Villatoro on 3/23/16.
//  Copyright © 2016 Rodrigo Villatoro. All rights reserved.
//

import Foundation

class Photo {
    let title: String
    let remoteURL: NSURL
    let photoID: String
    let dateTaken: NSDate
    
    init(title: String, photoID: String, remoteURL: NSURL, dateTaken: NSDate) {
        self.title = title
        self.photoID = photoID
        self.remoteURL = remoteURL
        self.dateTaken = dateTaken
    }
    
}