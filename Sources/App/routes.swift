import Fluent
import Vapor

func routes(_ app: Application) throws {
    /*
    app.get { req in
        return "It works!"
    }
    */

    try app.register(collection: TodoController())
    try app.register(collection: IndexController())
}
