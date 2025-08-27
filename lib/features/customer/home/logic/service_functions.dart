import 'package:fixly/core/routing/routes/customer_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void handleChatbot(BuildContext context) {
  // Navigate to chatbot/assistant screen
  // Navigator.pushNamed(context, '/fixly-assistant');
  context.push(CustomerRoutes.fixlyAssistantScreen);
}

void handleServiceSelect(BuildContext context, String serviceId) {
  // Navigate to specific service screen
  // Navigator.pushNamed(context, '/service/$category/$serviceId');
  context.push(CustomerRoutes.chatProvidersDetailsScreen, extra: serviceId);
}

void handleUnsure(BuildContext context) {
  // Navigate to assistant for help
  // Navigator.pushNamed(context, '/fixly-assistant');
  context.push(CustomerRoutes.fixlyAssistantScreen);
}
