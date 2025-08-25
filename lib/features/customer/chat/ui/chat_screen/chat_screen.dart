import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/features/customer/chat/ui/chat_screen/widgets/fixly_assistant_button.dart';
import 'package:fixly/features/customer/chat/ui/chat_screen/widgets/recent_conversation_single_widget.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.background,
        elevation: 0,
        title: Text("FixlyChat", style: context.textStyles.screenTitle),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Get instant help and manage your conversations",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 20),

            // Fixly Assistant Card
            const FixlyAssistantButton(),

            verticalSpacing(24),
            const Text(
              "Recent Conversations",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            verticalSpacing(16),
            // Conversation 1
            RecentConversationSingleWidget(
              title: "Kitchen Sink Issue",
              subtitle: "Thank you! The drain cleaner worked perfectly.",
              icon: Icons.kitchen,
              time: 'Yesterday',
              circleColor: context.colors.accent,
            ),
            // Conversation 2
            verticalSpacing(10),
            RecentConversationSingleWidget(
              title: "AC Not Cooling",
              subtitle: "Technician Ahmed will arrive at 3:00 PM",
              icon: Icons.ac_unit,

              time: "Yesterday",
              circleColor: context.colors.facebook,
            ),
          ],
        ),
      ),

      // Bottom Navigation
    );
  }

  // Reusable conversation card
}
