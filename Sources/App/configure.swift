import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "jorgeluis",
        password: Environment.get("DATABASE_PASSWORD") ?? "j",
        database: Environment.get("DATABASE_NAME") ?? "vaporbeers"
    ), as: .psql)

    app.migrations.add(CreateLocation())
    app.migrations.add(CreateTodo())
    app.migrations.add(CreateBeer())
    app.migrations.add(CreateIngredient())
    app.migrations.add(CreateWarehouse())
    app.migrations.add(CreateBatch())
    app.migrations.add(CreateInventory())

    // Command
    let seed = SeederCommand(app: app)
    app.commands.use(seed as AnyCommand, as: "seeder")
    
    let rawVersionSql = VersionCommand(app: app)
    app.commands.use(rawVersionSql as AnyCommand, as: "version")
    
    if app.environment == .development {
        print("Development!")
    }


    // register routes
    try routes(app)
    
}
