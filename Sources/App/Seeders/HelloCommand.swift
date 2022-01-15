import Vapor

class HelloCommand: Command {
    struct Signature: CommandSignature { }

    var name: String
    var app: Application

    init(name: String, app: Application)
    {
        self.name = name
        self.app = app
    }

    var help: String {
        "Says hello"
    }

    func run(using context: CommandContext, signature: Signature) throws {
        context.console.print("Hello, world!")
        context.console.print(self.name)
        // Seeder
        app.migrations.add(LocationSeed())
        LocationSeed()
        context.console.print("Test seeder")
    }
}
