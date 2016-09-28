import Foundation
import Alembic

final class User: InitDistillable {
    let name: String
    let age: Int

    init(json j: JSON) throws {
        name = try j <| "name"
        age = try j <| "age"
    }
}

let j = JSON(["user": ["name": "Robert", "age": 51]])

let name: String = try! j.distil(["user", "name"]).map { "Mr." + $0  }
print(name)

let age: Int = try! j.distil(["user", "age"]).filter { $0 >= 0 }
print(age)

let user: User = try! j <| "user"
print("Name: \(user.name), Age: \(user.age)")
