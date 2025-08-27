import 'package:fixly/core/network/gemini/service_providers_database.dart';
import 'package:fixly/core/routing/routes/customer_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void handleChatbot(BuildContext context) {
  // Navigate to chatbot/assistant screen
  // Navigator.pushNamed(context, '/fixly-assistant');
  context.push(CustomerRoutes.fixlyAssistantScreen);
}

void handleServiceSelect(BuildContext context, String serviceName) async {
  // Navigate to specific service screen
  final availableTechniciansList = await ServiceProvidersDatabase().getProviders(service: serviceName);
  print(availableTechniciansList);
  context.push(CustomerRoutes.chatProvidersDetailsScreen, extra: availableTechniciansList);
}

void handleUnsure(BuildContext context) {
  // Navigate to assistant for help
  // Navigator.pushNamed(context, '/fixly-assistant');
  context.push(CustomerRoutes.fixlyAssistantScreen);
}
