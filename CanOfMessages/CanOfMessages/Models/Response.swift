//
//  Response.swift
//  CanOfMessages
//
//  Created by boland on 1/24/17.
//  Copyright © 2017 mallocmedia. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: AnyObject]

let url:URL = URL(string: "localhost:8080/messages")!

final class Webservice {
    func load<A>(resource: Resource<A>, completion: @escaping (A?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { (data, _, _) in
            print("test")
            let result = data.flatMap(resource.parse)
            completion(result)
            }.resume()
    }
}

struct Resource<A> {
    let url: URL
    let parse: (Data) -> A?
}

extension Resource {
    init(url: URL, parseJSON: @escaping (Any) -> A?) {
        self.url = url
        self.parse = { data in
            let json =  try? JSONSerialization.jsonObject(with: data, options: [])
            return json.flatMap(parseJSON)
        }
    }
}

struct Response {
    let message: String
    let id: String
    let group: String //could be an enum
    let created: Date?
    let owner: String?
    //what else would i want in here?
}

extension Response {
    
    init?(dictionary: JSONDictionary) {
        guard let id = dictionary["id"] as? String, let message = dictionary["message"] as? String,
            let group = dictionary["group"] as? String,
            let owner = dictionary["owner"] as? String else { return nil }
        self.id = id
        self.message = message
        self.group = group
        self.created = dictionary["created"] as? Date
        self.owner = owner
    }
    
    static let all = Resource<[Response]>(url: url, parseJSON:{ json in
        guard let dictionaries = json as? [JSONDictionary] else { return nil }
        return dictionaries.flatMap(Response.init)
    })

}
