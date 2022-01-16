import Vapor
import SQLKit
import Rainbow

class VersionCommand: Command {
    struct Signature: CommandSignature { }
    
    var app: Application

    init(app: Application)
    {
        self.app = app
    }

    var help: String {
        "Raw SQL"
    }

    func run(using context: CommandContext, signature: Signature) throws {
        context.console.print("Raw SQL Begin ...".lightBlue)
        
        if let sql = app.db as? SQLDatabase {
            // The underlying database driver is SQL.
            let result = try sql.raw("select version() as version")
                .all().wait()
            
            for r in result {
                let version = try r.decode(column: "version", as: String.self)
                print(version.green)
            }
        }
        
        context.console.print("Raw SQL End ...".lightBlue)

    }
}
