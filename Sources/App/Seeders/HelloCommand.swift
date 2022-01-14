import Vapor

struct HelloCommand: Command {
    struct Signature: CommandSignature { }

    var help: String {
        "Says hello"
    }

    func run(using context: CommandContext, signature: Signature) throws {
        context.console.print("Hello, world!")
    }
}
