import Fluent

struct CreateBeer: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("beers")
            .field("id", .custom("int generated always as identity"), .identifier(auto: false))
            .field("name", .custom("varchar"), .required)
            .field("brand", .custom("varchar"), .required)
            .field("date_released", .custom("timestamp without time zone"), .required)
            .field("location_id", .custom("int"))
            .foreignKey("location_id", 
                references: Location.schema, 
                .id, onDelete: .restrict, 
                onUpdate: .noAction,
                name: "fk_beers_location")
            //.unique(on: ("name", "brand"), name: "Uk_beer")
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("beers").delete()
    }
}
