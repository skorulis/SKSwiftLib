//
//  PathHelper.swift
//  SKSwiftLib
//
//  Created by Alexander Skorulis on 20/7/18.
//

import Foundation

public class PathHelper: NSObject {

    public static func documentsDirectoryPath() -> String {
        let fullPath = documentsDirectory().absoluteString
        let index = fullPath.index(fullPath.startIndex, offsetBy: 7)
        return String(fullPath.suffix(from: index))
    }
    
    public static func documentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
    }
    
}
