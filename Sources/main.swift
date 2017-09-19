import Alembic

struct Person: Parsable {
    let name: String
    let age: Int

    static func value(from json: JSON) throws -> Person {
        return try .init(
            name: json.value(for: "name"),
            age: json.value(for: "age")
        )
    }
}

let json: JSON = [
    "persons": [
        ["name": "Robert", "age": 51],
        ["name": "Tony", "age": 43]
    ]
]

do {
    let name: String = try json.value(for: ["persons", 0, "name"])
    print(name)

    let age: Int = try json.parse(for: ["persons", 0, "age"])
        .filter { $0 >= 0 }
        .value()
    print(age)

    let persons: [Person] = try json.value(for: "persons")
    print(persons)

} catch let error {

    print("Failed to parse JSON: \(error)")
}