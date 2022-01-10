import Fluent
import Vapor

struct ApplicationInfo: Content {
  var application: ApplicationName
  var success: Bool
}

struct ApplicationName: Content {
  var name: String
}


struct IndexController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        // Index /
        let route = routes.grouped("")
        route.get(use: index)
    }

    func index(req: Request) throws -> ApplicationInfo {
        let name = ApplicationName(name: "Example in Swift with Vapor")
        let app = ApplicationInfo(application: name, success: true)
        print("Application: \(app)")
        /*
        Convert dictionary to JSON
        let jsonDic = ["name":"Alan"]
        let data = try JSONSerialization.data(withJSONObject: jsonDic, options: .prettyPrinted)
        let jsonString = String(data: data, encoding: .utf8)
        return jsonString ?? "FAILED
        */
        return app
    }
}
