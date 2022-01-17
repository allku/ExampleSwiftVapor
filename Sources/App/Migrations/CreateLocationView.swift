import Fluent
import SQLKit
import Foundation
import Rainbow

// Home folder
//let home = FileManager.default.homeDirectoryForCurrentUser

struct CreateLocationView: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {

        let currentPath = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        let sqlPath = currentPath.appendingPathComponent("Sql")
        
        do {
            let filePath = sqlPath.path + "/" + "v_locations.sql"
            
            print(filePath.green)
            
            let ddlSql = try String(contentsOfFile: filePath)
            
            print(ddlSql.green)
            
            let sql = database as! SQLDatabase
            return sql.raw(
                SQLQueryString(ddlSql)
            ).run()
        } catch {
            print("Unexpected error: \(error)".red.bold.blink)
            return database.eventLoop.future()
        }
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        let sql = database as! SQLDatabase
        return sql.raw("DROP VIEW v_locations").run()
    }
}

