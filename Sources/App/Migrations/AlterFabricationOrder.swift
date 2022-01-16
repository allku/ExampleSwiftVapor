import Fluent
import SQLKit

struct UpdateFabricationOrder: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
            return database.raw("ALTER TABLE emp MODIFY COLUMN name VARCHAR(100);").run()
      /*
            return database as? SQLDatabase {
             try sql.raw("ALTER TABLE fabrications_orders ADD CONSTRAINT fabrications_orders_fk FOREIGN KEY (code_warehouse,code_batch,ingredient_id) REFERENCES inventories(code_warehouse,code_batch,ingredient_id) ON DELETE RESTRICT ON UPDATE RESTRICT")
                .all()
        }
            */
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("fabrications_orders").delete()
    }
}
