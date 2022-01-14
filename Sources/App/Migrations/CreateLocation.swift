import Fluent

struct CreateLocation: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("locations")
            .field("id", .custom("int generated always as identity"), .identifier(auto: false))
            .field("name", .custom("varchar"), .required)
            .field("observation", .custom("varchar"), .required)
            .field("status", .custom("varchar"), .required)
            .field("location_id", .custom("int"))
            .foreignKey("location_id", 
                references: Location.schema, 
                .id, onDelete: .cascade, 
                onUpdate: .noAction,
                name: "fk_locations_location")
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("locations").delete()
    }
}
