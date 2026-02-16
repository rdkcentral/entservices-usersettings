# ARCHITECTURE.md

## Overview
The `entservices-usersettings` repository is a standalone RDK plugin that provides user settings management for RDK-based devices. It is designed as a WPEFramework plugin, integrating with the Thunder framework for IPC, configuration, and lifecycle management. The repository contains only the usersettings plugin and its direct dependencies, ensuring a focused and maintainable codebase.

## System Architecture
- **Plugin Structure:**
  - The plugin is implemented in C++ and follows the WPEFramework plugin interface conventions.
  - The main entry point is the `plugin/` directory, containing all source, header, and configuration files for the usersettings plugin.
- **Component Interactions:**
  - The plugin interacts with the Thunder framework for lifecycle events, configuration, and IPC.
  - It exposes JSON-RPC APIs for external clients to manage user settings.
  - Internal utility helpers (e.g., `UtilsLogging`, `UtilsJsonRpc`) are used for logging and JSON-RPC handling.
- **Data Flow:**
  - API requests are received via Thunder's JSON-RPC interface.
  - The plugin processes requests, interacts with configuration and storage as needed, and returns responses via JSON-RPC.

## Plugin Framework Integration
- **Thunder Integration:**
  - The plugin registers itself with Thunder at startup, providing metadata and API definitions.
  - Lifecycle methods (`Initialize`, `Deinitialize`, etc.) are implemented as per Thunder's requirements.
  - Configuration is managed via Thunder's configuration system, with support for runtime updates.
- **API Exposure:**
  - All user settings operations are exposed as JSON-RPC endpoints.
  - API schemas are defined in the `interfaces/json/` headers and implemented in the plugin.

## Dependencies and Interfaces
- **Direct Dependencies:**
  - Thunder (WPEFramework) for plugin lifecycle, IPC, and configuration.
  - Internal helpers: `UtilsLogging.h`, `UtilsJsonRpc.h`.
  - Telemetry and continuewatching plugin options are preserved for integration.
- **External Interfaces:**
  - JSON-RPC for API communication.
  - Configuration files for plugin setup.

## Technical Implementation Details
- **Build System:**
  - CMake is used for build configuration, with only usersettings and required dependencies included.
  - All build scripts and CMake files reference `usersettings` (now `plugin`) only.
- **Testing:**
  - L1 and L2 tests are provided for usersettings only, using the preserved test framework structure.
- **Extensibility:**
  - The plugin is designed for easy extension and integration with other RDK components via Thunder.

---
*This document provides a high-level architectural overview. For detailed API and code documentation, refer to the source files and JSON-RPC interface definitions.*
