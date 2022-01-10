import Fluent

struct CreateBeer: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("beers")
            .field("id", .custom("bigint generated always as identity"), .identifier(auto: false))
            .field("name", .custom("varchar"), .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("beers").delete()
    }
}
