

  import 'package:flutter/material.dart';

void handleChatbot(BuildContext context) {
    // Navigate to chatbot/assistant screen
    // Navigator.pushNamed(context, '/fixly-assistant');
    print('Navigate to Fixly Assistant');
  }

  void handleServiceSelect(BuildContext context, String serviceId) {
    // Navigate to specific service screen
    // Navigator.pushNamed(context, '/service/$category/$serviceId');
    print('Navigate to service: $serviceId');
  }

  void handleUnsure(BuildContext context) {
    // Navigate to assistant for help
    // Navigator.pushNamed(context, '/fixly-assistant');
    print('Navigate to Fixly Assistant for help');
  }