import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:si_assessment/core/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final bool showBackButton;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.showBackButton = true,
    this.leading,
    this.actions,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appTheme = AppThemes.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
      child: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(color: Colors.transparent),
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isDarkMode
                      ? [Colors.black.withOpacity(0.5), Colors.black.withOpacity(0.2)]
                      : [Colors.white.withOpacity(0.6), Colors.white.withOpacity(0.2)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: centerTitle,
            title: titleWidget ??
                Text(
                  title ?? "",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: appTheme.textTheme.bodyLarge?.color,
                  ),
                ),
            leading: showBackButton
                ? IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: appTheme.iconTheme.color),
              onPressed: () => Navigator.pop(context),
            )
                : leading,
            actions: actions,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}