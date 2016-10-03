import Foundation
import Alembic

struct User: Distillable {
    let name: String
    let age: Int
    
    static func distil(json j: JSON) throws -> User {
        return try User(name: j <| "name", age: j <| "age")
    }
}

let object = [
    "users": [
        ["name": "Robert", "age": 51],
        ["name": "Tony", "age": 43]
    ]
]

do {
    
    let j = JSON(object)
    
    let name: String = try j.distil(["users", 0, "name"])
        .map { "Mr." + $0  }
    print(name)
    
    let age: Int = try j.distil(["users", 0, "age"])
        .filter { $0 >= 0 }
    print(age)
    
    let users: [User] = try j.distil("users")
    print(users)
    
} catch let error {
    
    print("Failed to parse JSON: \(error)")
    
}
