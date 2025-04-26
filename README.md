# Dart MCP Server Template

A template repository for creating Dart server applications compatible with MCP (Model Control Protocol). This template provides a starting point with Docker configuration, server implementations, and basic project structure.

## About This Template

This template includes:
- A streamable HTTP server implementation for MCP
- Docker configuration for easy deployment
- Basic project structure with lib, bin, and test directories
- Integration with the mcp_dart package

## Using This Template

Clone this repository and manually update the package name:

```bash
git clone https://github.com/jhgaylor/dart-mcp-server-template.git my_new_mcp_server
cd my_new_mcp_server

# Update the package name throughout the codebase
find . -type f -name "*.dart" -o -name "pubspec.yaml" | xargs sed -i 's/dart_mcp_server_template/my_new_mcp_server/g'
# Update the package name in the repository URL
find . -type f -name "*.md" -o -name "Dockerfile" | xargs sed -i 's/dart-mcp-server-template/my-new-mcp-server/g'
# Rename the files
find . -type f -name "*dart_mcp_server_template*" | while read file; do mv "$file" "${file//dart_mcp_server_template/my_new_mcp_server}"; done

# Remove the .git directory to start fresh
rm -rf .git

# Initialize a new git repository
git init
```

Then update the package name in pubspec.yaml and throughout the codebase.

## Getting Started

After creating your project from this template:

1. Update the pubspec.yaml with your project details
2. Modify the configuration in lib/src/config.dart as needed
3. Implement your custom server logic
4. Run the server with `dart bin/streamable_http_server.dart`

## Docker Deployment

This template includes a Dockerfile for easy containerization:

```bash
# Build the Docker image
docker build -t my-mcp-server .

# Run the container
docker run -p 3000:3000 my-mcp-server
```

## License

[Add your license information here]
