import Fluent

struct CreateWarehouse: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("warehouses")
            .field("id", .custom("int generated always as identity"), .identifier(auto: false))
            .field("code", .custom("varchar"), .required)
            .field("name", .custom("varchar"), .required)
            .field("status", .custom("varchar"), .required)
            .unique(on: "code", name: "Uk_Warehouses")
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("warehouses").delete()
    }
}
