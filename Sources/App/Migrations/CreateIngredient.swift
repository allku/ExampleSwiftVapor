import Fluent

struct CreateIngredient: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("ingredients")
            .field("id", .custom("int generated always as identity"), .identifier(auto: false))
            .field("name", .custom("varchar"), .required)
            .field("beer_id", .custom("int"), .required)
            .foreignKey("beer_id",
                references: Beer.schema,
                .id, onDelete: .cascade,
                onUpdate: .noAction,
                name: "fk_ingredients_beer")
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("ingredients").delete()
    }
}
