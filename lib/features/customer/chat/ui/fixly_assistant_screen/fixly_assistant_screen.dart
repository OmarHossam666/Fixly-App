import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/network/gemini/gemini_api.dart';
import 'package:fixly/core/network/gemini/service_providers_database.dart';
import 'package:fixly/core/routing/routes/customer_routes.dart';
import 'package:fixly/core/widgets/surface_dark.dart';
import 'package:fixly/features/customer/chat/ui/fixly_assistant_screen/widgets/fixly_assistant_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// Main Chat Screen
class FixlyAssistantScreen extends StatefulWidget {
  const FixlyAssistantScreen({super.key});

  @override
  FixlyAssistantScreenState createState() => FixlyAssistantScreenState();
}

class FixlyAssistantScreenState extends State<FixlyAssistantScreen> {
  List<Map<String, String>> chatList = [
    {
      "content":
          "👋 Welcome! How can I help you today with your home service needs?",
      "role": "assistant",
    },
  ];
  List<Map<String, dynamic>>? finalResult;
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  //-----------------------------------------------------------------------------------------------------------------

  // if (_finalResult != null && context.mounted) {
  //                           context.push(
  //                             CustomerRoutes.chatProvidersDetailsScreen,
  //                             extra: result,
  //                           );
  //                         }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: fixlyAssistantAppBar(context),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0.w,
                  vertical: 25.h,
                ),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: chatList.length,
                  itemBuilder: (context, index) {
                    final isUser = chatList[index]["role"] == "user";

                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        mainAxisAlignment: isUser
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Assistant icon (left side)
                          if (!isUser) ...[
                            CircleAvatar(
                              backgroundColor: context.colors.accent,
                              child: const Icon(Icons.psychology),
                            ),
                            SizedBox(width: 8.w),
                          ],

                          // Chat bubble with proper constraints
                          Column(
                            crossAxisAlignment: isUser
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width *
                                      0.75, // Max 75% of screen width
                                ),
                                child: SurfaceDark(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 8.h,
                                  ),
                                  margin: EdgeInsets
                                      .zero, // Remove margin from SurfaceDark
                                  borderRadiusAll: true,
                                  allRadius: 10,
                                  borderColorAll: true,
                                  child: Text(
                                    chatList[index]["content"]!,
                                    style: context.textStyles.bodyTextBold,
                                    softWrap: true,
                                  ),
                                ),
                              ),
                              if (finalResult != null &&
                                  finalResult!.isNotEmpty &&
                                  !isUser &&
                                  chatList[index] == chatList.last) ...[
                                SizedBox(width: 8.w),
                                InkWell(
                                  onTap: () {
                                    if (context.mounted) {
                                      context.push(
                                        CustomerRoutes
                                            .chatProvidersDetailsScreen,
                                        extra: finalResult,
                                      );
                                    }
                                  },
                                  child: SurfaceDark(
                                    surfaceColor: context.colors.accent,
                                    margin: EdgeInsets.symmetric(vertical: 8.h),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 8.h,
                                    ),
                                    borderRadiusAll: true,
                                    allRadius: 10,
                                    child: Text(
                                      "View Technicians",
                                      style: context.textStyles.bodyTextBold
                                          .copyWith(
                                            color: context.colors.textOnAccent,
                                          ),
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),

                          // User icon (right side)
                          if (isUser) ...[
                            SizedBox(width: 8.w),
                            CircleAvatar(
                              backgroundColor: context.colors.facebook,

                              child: const Icon(Icons.person),
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 30),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          fillColor: context.colors.surfaceSecondary,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.r),
                            borderSide: BorderSide(
                              color: context.colors.borderLight,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.r),
                            borderSide: BorderSide(
                              color: context.colors.borderLight,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () async {
                        final result = await handleSend();
                        if (result != null && result.isNotEmpty && mounted) {
                          setState(() {
                            finalResult = result;
                          });
                        }
                      },
                      icon: Transform.rotate(
                        angle: -0.7, // in radians (~ -28.6°)

                        child: Icon(
                          Icons.send,
                          color: context.colors.textOnAccent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //-----------------------------------------------------------------------------------------------------------------

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  Future<List<Map<String, dynamic>>>? handleSend() async {
    finalResult = null;
    final userInput = _textController.text.trim();
    if (userInput.isEmpty) return [];

    _textController.clear();
    chatList.add({"content": userInput, "role": "user"});
    chatList.add({"content": "⏳ Let me think...", "role": "assistant"});
    setState(() {
      _scrollToBottom();
    });

    try {
      // 🔧 Follow-up case if awaiting clarification

      // 🔧 Regular first-time Gemini call
      final result = await callGemini(userInput);

      chatList.removeLast(); // Remove "thinking..."
      chatList.add({"content": result['response'], "role": "assistant"});
      if (result['service'] != 'none') {
        return ServiceProvidersDatabase().getProviders(
          service: result['service'],
        );
      }

      setState(() {
        _scrollToBottom();
      });
      return [];
    } catch (e) {
      chatList.removeLast();
      chatList.add({
        "content": "😓 Sorry, something went wrong. Please try again!",
        "role": "assistant",
      });
      setState(() {
        _scrollToBottom();
      });
      return [];
    }
  }
}
