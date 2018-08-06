//
//  ImageGen.swift
//  floatios
//
//  Created by Alexander Skorulis on 3/8/18.
//  Copyright © 2018 Skorulis. All rights reserved.
//

import CoreGraphics

open class ImageGen: NSObject {
    
    public let rootDir:String
    
    public var currentContext:CGContext?
    
    public init(rootDir:String) {
        self.rootDir = rootDir
        
        let path = PathHelper.documentsDirectoryPath() + rootDir
        do {
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: false, attributes: nil)
        } catch {
            
        }
        
        print("Writing images to " + path)
    }
    
    public func newContext(_ size:CGSize) -> CGContext {
        let colorSpace:CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1, y: -1)
        self.currentContext = context
        return context
    }
    
    public func finishContext(context:CGContext? = nil) -> UIImage {
        if context == nil {
            assert(self.currentContext != nil,"Context has gotten lost")
            return self.finishContext(context:self.currentContext)
        }
        
        let cgImage = context!.makeImage()!
        let img = UIImage(cgImage: cgImage)
        self.currentContext = nil
        return img
    }
    
    #if os(OSX)
    public func saveImage(name:String,image:UIImage) {
        //Currently a no op
    }
    
    
    #elseif os(iOS)
    public func saveImage(name:String,image:UIImage) {
        let data = UIImagePNGRepresentation(image)
        let fileName = name + ".png"
        let fileURL = PathHelper.documentsDirectory().appendingPathComponent(rootDir).appendingPathComponent(fileName)
        do {
            try data?.write(to: fileURL)
        } catch {}
    }
    
    #endif
    
    
}

