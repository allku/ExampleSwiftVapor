import Fluent
import SQLKit

struct CreateLocationView: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        
        let sql = database as! SQLDatabase
        return sql.raw("select version() as version").run()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        let sql = database as! SQLDatabase
        return sql.raw("DROP VIEW v_locations").run()
    }
}

