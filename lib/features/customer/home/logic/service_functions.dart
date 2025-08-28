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
<<<<<<< HEAD
  final availableTechniciansList = await ServiceProvidersDatabase().getProviders(service: serviceName);
  if(context.mounted) {
    context.push(CustomerRoutes.chatProvidersDetailsScreen, extra: availableTechniciansList);
=======
  final availableTechniciansList = await ServiceProvidersDatabase()
      .getProviders(service: serviceName);
  if (context.mounted) {
    context.push(
      CustomerRoutes.chatProvidersDetailsScreen,
      extra: availableTechniciansList,
    );
>>>>>>> bc5d2289c466caf86910f42cad3ec884973a152e
  }
}

void handleUnsure(BuildContext context) {
  // Navigate to assistant for help
  // Navigator.pushNamed(context, '/fixly-assistant');
  context.push(CustomerRoutes.fixlyAssistantScreen);
}
