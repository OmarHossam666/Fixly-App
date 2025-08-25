import 'package:flutter/material.dart';

class FixlyAssistantChatProvidersDetailsScreen extends StatelessWidget {
  final List<Map<String, dynamic>>? providersList;
  const FixlyAssistantChatProvidersDetailsScreen({super.key, required this.providersList});

  @override
  Widget build(BuildContext context) {

    return providersList != null ? Text(providersList?.map((provider) => provider['first_name'] as String).join(', ') ?? ''): const SizedBox();
  }
}