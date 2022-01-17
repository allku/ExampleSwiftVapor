import Fluent
import SQLKit
import Foundation

// Home folder
//let home = FileManager.default.homeDirectoryForCurrentUser

struct CreateLocationView: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {

        let currentPath = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        let sqlPath = currentPath.appendingPathComponent("Sql")
        
        let filePath = self
            .append(
                toPath: sqlPath.absoluteString,
                withPathComponent: "v_locations.sql") 


        if let command = try String(contentsOfFile: filePath) {
            let sql = database as! SQLDatabase
            return sql.raw(SQLQueryString(command)).run()
        }

        return database.eventLoop.future()

        //return sql.raw("select version() as version").run()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        let sql = database as! SQLDatabase
        return sql.raw("select version() as version").run()
        // return sql.raw("DROP VIEW v_locations").run()
    }

    private func append(toPath path: String, 
                        withPathComponent pathComponent: String) -> String? 
    {
        if var pathURL = URL(string: path) 
        {
            pathURL.appendPathComponent(pathComponent)

            return pathURL.absoluteString
        }

        return nil
    }
}

