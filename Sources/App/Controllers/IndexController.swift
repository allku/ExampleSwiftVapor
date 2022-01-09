import Fluent
import Vapor

struct Person: Content {
  var name: String
  var age: Int
}

struct IndexController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let route = routes.grouped("index")
        route.get(use: index)
    }

    func index(req: Request) throws -> Person {
        let person1 = Person(name: "Jorge  á, é, í, ó, ú", age: 39)
        print("Name: \(person1.name) and Age: \( person1.age)")
        /*
        Convert dictionary to JSON
        let jsonDic = ["name":"Alan"]
        let data = try JSONSerialization.data(withJSONObject: jsonDic, options: .prettyPrinted)
        let jsonString = String(data: data, encoding: .utf8)
        return jsonString ?? "FAILED
        */
        return person1
    }
}
