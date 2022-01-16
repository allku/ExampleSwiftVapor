import Fluent

struct CreateFabricationOrder: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("fabrications_orders")
            .field("id", .custom("int generated always as identity"), .identifier(auto: false))
            .field("date_fabrication", .custom("timestamp without time zone"), .required)
            .field("ingredient_id", .custom("int"))
            .field("code_warehouse", .custom("varchar"), .required)
            .field("code_batch", .custom("varchar"), .required)
            .field("quantity", .custom("numeric"), .required)           
            /*
            // It does not work my preferred hypothetical way
            .foreignKey("ingredient_id" ,"code_warehouse", "code_batch", 
                references: "inventories", "ingredient_id", "code_warehouse", "code_batch",
                onDelete: .restrict, 
                onUpdate: .noAction,
                name: "fk_fabrications_orders_invemtories")
            */
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("fabrications_orders").delete()
    }
}
