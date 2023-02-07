//
//  FileManager-DocumentsDirectory.swift
//  Day-70-BucketList
//
//  Created by Ojas Gupta on 7/2/2023.
//

import Foundation


extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
