import Fluent
import Vapor

final class Inventory: Model, Content {

    static let schema = "inventories"

    @ID(custom: "id")
    var id: Int?

    @Field(key: "quantity")
    var quantity: Float 

    @Parent(key: "ingredient_id")
    var ingredient: Ingredient
    
    @Parent(key: "code_warehouse")
    var codeWarehouse: Warehouse
    
    @Parent(key: "code_batch")
    var codeBatch: Batch
    
    init() { }

    init(id: Int? = nil, 
         warehouse: Warehouse, 
         batch: Batch, 
         quantity: Float,
         ingredient: Ingredient) throws {
        self.id = id
        self.codeWarehouse.code = codeWarehouse.code
        self.codeBatch.code = codeBatch.code
        self.quantity = quantity
        self.$ingredient.id = try ingredient.requireID()
    }
}
