import 'dart:io';

class Config {
  // Server configuration
  late final String host;
  late final int port;
  late final String environment;

  // Server info
  late final String serverName;
  late final String serverVersion;

  Config() {
    // Server configuration - from environment variables
    host = _getEnvVar('HOST', '0.0.0.0');
    port = int.tryParse(_getEnvVar('PORT', '3000')) ?? 3000;
    environment = _getEnvVar('ENVIRONMENT', 'development');

    serverName = _getEnvVar('SERVER_NAME', 'dart-mcp-server-template');
    serverVersion = _getEnvVar('SERVER_VERSION', '1.0.0');
  }

  // Get environment variable with fallback
  static String _getEnvVar(String name, String defaultValue) {
    return Platform.environment[name] ?? defaultValue;
  }

}
