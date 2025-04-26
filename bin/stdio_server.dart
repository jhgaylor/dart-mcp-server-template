import 'package:mcp_dart/mcp_dart.dart';
import 'package:dart_mcp_server_template/dart_mcp_server_template.dart';

void main(List<String> args) async {
  final mcpServer = await createMcpServer();
  mcpServer.connect(StdioServerTransport());
}
