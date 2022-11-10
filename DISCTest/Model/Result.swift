//
//  Result.swift
//  DISCTest
//
//  Created by yongseopKim on 2022/11/10.
//

import UIKit

struct Result: Codable {
    /// for Singleton design pattern
    static let shared: Result? = Result()
    
    // Instance Properties
    let d: Info
    let i: Info
    let s: Info
    let c: Info
    
    /// Custom Failable Initializer
    private init?() {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "Result") else {
            return nil
        }
        
        do {
            let result: Result = try JSONDecoder().decode(Result.self, from: dataAsset.data)
            self = result
        } catch {
            return nil
        }
    }
}

extension Result {
    struct Info: Codable {
        let title: String
        let typeDescription: String
    }
}
