import 'package:mcp_dart/mcp_dart.dart';

/// Creates and configures the MCP server with all resources
Future<McpServer> createMcpServer() async {

  final mcpServer = McpServer(
    Implementation(name: "dart-mcp-server-template", version: "1.0.0"),
    options: ServerOptions(capabilities: ServerCapabilities()),
  );

  mcpServer.tool(
    "say_hello",
    description: "Say hello to the world",
    callback: ({args, extra}) async {
      return CallToolResult(
        content: [
          TextContent(
            text: "Hello, world!",
          ),
        ],
      );
    },
  );

  mcpServer.resource(
    "Greeting",
    "greeting://",
    (uri, extra) async {
      final greeting = "Hello, world!";

      return ReadResourceResult(
        contents: [
          TextResourceContents(
            uri: "greeting://",
            mimeType: "text/plain",
            text: greeting,
          ),
        ],
      );
    },
  );

  return mcpServer;
}
