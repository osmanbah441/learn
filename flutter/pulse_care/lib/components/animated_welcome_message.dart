import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:pulse_care/components/theme/colors.dart';

class AnimatedWelcomeMessage extends StatefulWidget {
  const AnimatedWelcomeMessage({super.key, this.filterButton});

  final VoidCallback? filterButton;

  @override
  State<AnimatedWelcomeMessage> createState() => _AnimatedWelcomeMessageState();
}

class _AnimatedWelcomeMessageState extends State<AnimatedWelcomeMessage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Timer _timer;
  int _currentIndex = 0;

  static const List<String> _subMessages = [
    "Bring answers and healing to your patients.",
    "Each test brings you closer to clear treatment.",
    "Ready to crack some medical mysteries?",
    "Your work brings hope to every patient.",
    "Every test unlocks a new story.",
    "Precision today, healthier lives tomorrow.",
    "Be the bridge between questions and answers.",
    "Let science guide your patients to health.",
    "Turn data into better outcomes.",
    "Stay curious and compassionate for better care.",
  ];

  @override
  void initState() {
    super.initState();

    // Animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Start animations and the loop
    _controller.forward();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      // set the interval
      setState(() {
        _currentIndex = (_currentIndex + 1) % _subMessages.length;
        _controller.reset();
        _controller.forward();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isDesktop = MediaQuery.of(context).size.width >= 768;

    final welcomeMessage = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                _subMessages[_currentIndex],
                style: textTheme.headlineSmall?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: AppColors.lightGreen,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    final searchBar = SearchBar(
      trailing: widget.filterButton != null
          ? [
              IconButton(
                onPressed: widget.filterButton,
                icon: const Icon(Icons.filter_list),
              )
            ]
          : null,
      hintText: 'search here',
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 16),
      ),
      leading: const Icon(Icons.search),
    );

    return Column(
      children: [
        isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  welcomeMessage,
                  const SizedBox(width: 8),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 320),
                    child: searchBar,
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  welcomeMessage,
                  const SizedBox(height: 16),
                  searchBar,
                ],
              ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
      ],
    );
  }
}
