import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/features/customer/chat/ui/chat_screen/widgets/fixly_assistant_button.dart';
import 'package:fixly/features/customer/chat/ui/chat_screen/widgets/recent_conversation_single_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<RecentConversationSingleWidget> conversations = [
      RecentConversationSingleWidget(
        title: "Kitchen Sink Issue",
        subtitle: "Thank you! The drain cleaner worked perfectly.",
        icon: Icons.kitchen,
        time: 'Yesterday',
        circleColor: context.colors.accent,
      ),
      RecentConversationSingleWidget(
        title: "AC Not Cooling",
        subtitle: "Technician Ahmed will arrive at 3:00 PM",
        icon: Icons.ac_unit,
        time: "Yesterday",
        circleColor: context.colors.facebook,
      ),
    ];

    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('FixlyChat', style: context.textStyles.headline),
              verticalSpacing(8),
              Text(
                "Get instant help and manage your conversations",
                style: context.textStyles.bodyText,
              ),
              verticalSpacing(20),

              // Fixly Assistant Card
              const FixlyAssistantButton(),

              verticalSpacing(24),
              Text(
                "Recent Conversations",
                style: context.textStyles.sectionHeader,
              ),
              verticalSpacing(16),

              Expanded(
                child: ListView.builder(
                  itemCount: conversations.length,
                  shrinkWrap: true,
                  primary: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return conversations[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation
    );
  }

  // Reusable conversation card
}
