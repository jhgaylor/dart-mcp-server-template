import 'package:dart_mcp_server_template/dart_mcp_server_template.dart';
import 'package:test/test.dart';
import 'package:mcp_dart/mcp_dart.dart';

void main() {
  group('MCP Server Tests', () {
    test('createMcpServer should create a valid MCP server', () async {
      final server = await createMcpServer();
      expect(server, isA<McpServer>());
    });
    
    // We can verify the server is configured properly
    // by testing the high-level components we're setting up
    test('McpServer should have the server set up', () async {
      final server = await createMcpServer();
      // Verify the server instance exists
      expect(server.server, isNotNull);
    });
  });
  
  group('Config Tests', () {
    test('Config should load default values', () {
      final config = Config();
      expect(config.host, equals('0.0.0.0'));
      expect(config.port, equals(3000));
      expect(config.environment, equals('development'));
      expect(config.serverName, equals('dart-mcp-server-template'));
      expect(config.serverVersion, equals('1.0.0'));
    });
  });
}
