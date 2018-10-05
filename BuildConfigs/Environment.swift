//
//  Environment.swift
//  BuildConfigs
//
//  Created by Hai Phung on 10/5/18.
//  Copyright © 2018 Hai Phung. All rights reserved.
//

import Foundation

final class Environment {
    private let configuration: [String : Any]
    
    init(configuration: [String : Any]) {
        self.configuration = configuration
    }
    
    convenience init() {
        guard let file = Bundle.main.infoDictionary?["Environment"] as? String else {
            fatalError()
        }
        
        let bundle = Bundle.main
        let path = bundle.path(forResource: file, ofType: "plist")!
        let configuration = NSDictionary(contentsOfFile: path) as! [String : Any]
        
        self.init(configuration: configuration)
    }
}


extension Environment {
    var name: String {
        return configuration["environment-name"] as! String
    }
    
    var baseUrl: String {
        return configuration["api-base-url"] as! String
    }
}
