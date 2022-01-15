import Fluent

struct CreateInventory: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("inventories")
            .field("id", .custom("int generated always as identity"), .identifier(auto: false))
            .field("code_warehouse", .custom("varchar"), .required)
            .field("code_batch", .custom("varchar"), .required)
            .field("quantity", .custom("numeric"), .required)
            .field("ingredient_id", .custom("int"))
            .foreignKey("ingredient_id", 
                references: Ingredient.schema, 
                .id, onDelete: .restrict, 
                onUpdate: .noAction,
                name: "fk_inventory_ingredient")
            .unique(on: "code_warehouse", "code_batch", "ingredient_id", 
                    name: "Uk_Inventories")
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("inventories").delete()
    }
}
