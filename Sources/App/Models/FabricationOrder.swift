import Fluent
import Vapor

final class FabricationOrder: Model, Content {

    static let schema = "fabrications_orders"

    @ID(custom: "id")
    var id: Int?

    @Field(key: "date_fabrication")
    var dateFabrication: Date
    
    @Parent(key: "ingredient_id")
    var ingredient: Ingredient
    
    @Parent(key: "code_warehouse")
    var codeWarehouse: Warehouse
    
    @Parent(key: "code_batch")
    var codeBatch: Batch
    
    @Field(key: "quantity")
    var quantity: Float 
    
    init() { }

    init(id: Int? = nil,
         dateFabrication: Date,
         ingredient: Ingredient,
         warehouse: Warehouse, 
         batch: Batch, 
         quantity: Float) throws {
        self.id = id
        self.dateFabrication = dateFabrication
        self.$ingredient.id = try ingredient.requireID()
        self.codeWarehouse.code = codeWarehouse.code
        self.codeBatch.code = codeBatch.code
        self.quantity = quantity
    }
}
