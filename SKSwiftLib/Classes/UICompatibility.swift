//
//  ColorCompatibility.swift
//  SKSwiftLib
//
//  Created by Alexander Skorulis on 6/8/18.
//

#if os(OSX)
import Cocoa

public typealias UIColor = NSColor

public typealias UIImage = NSImage

public typealias UIFont = NSFont

public extension NSImage {
    public var cgImage: CGImage? {
        var proposedRect = CGRect(origin: .zero, size: size)
        
        return cgImage(forProposedRect: &proposedRect,
                       context: nil,
                       hints: nil)
    }
    
    public convenience init?(named name: String) {
        self.init(named: Name(name))
    }
    
    public convenience init(cgImage:CGImage) {
        let size = NSSize(width:cgImage.width,height:cgImage.height)
        self.init(cgImage:cgImage,size:size)
    }
}

#endif
