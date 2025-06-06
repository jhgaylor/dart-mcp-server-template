import 'dart:io';

import 'package:mcp_dart/mcp_dart.dart';
import 'package:dart_mcp_server_template/dart_mcp_server_template.dart';

/// DEPRECATED: Use `bin/streamable_http_server.dart` instead.
Future<void> main() async {
  final config = Config();
  final mcpServer = await createMcpServer();

  final sseServerManager = SseServerManager(mcpServer);
  try {
    final server = await HttpServer.bind(
      config.host == '0.0.0.0'
          ? InternetAddress.anyIPv4
          : InternetAddress(config.host),
      config.port,
    );
    print('Server listening on http://${config.host}:${config.port}');

    await for (final request in server) {
      sseServerManager.handleRequest(request);
    }
  } catch (e) {
    print('Error starting server: $e');
    exitCode = 1;
  }
}
