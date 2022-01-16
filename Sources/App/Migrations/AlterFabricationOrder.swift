import Fluent
import SQLKit

struct AlterFabricationOrder: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        
        let sql = database as! SQLDatabase
        return sql.raw("ALTER TABLE fabrications_orders ADD CONSTRAINT fk_fabrications_orders_inventories FOREIGN KEY (code_warehouse,code_batch,ingredient_id) REFERENCES inventories(code_warehouse,code_batch,ingredient_id) ON DELETE RESTRICT ON UPDATE RESTRICT").run()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        let sql = database as! SQLDatabase
        return sql.raw("ALTER TABLE fabrications_orders DROP CONSTRAINT fk_fabrications_orders_inventories").run()
    }
}
