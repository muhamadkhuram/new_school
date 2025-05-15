import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/model/global/global_user_model.dart';

class SubscriptionStatusScreen extends StatefulWidget {
  final GlobalUser user;

  const SubscriptionStatusScreen({Key? key, required this.user})
      : super(key: key);

  @override
  State<SubscriptionStatusScreen> createState() =>
      _SubscriptionStatusScreenState();
}

class _SubscriptionStatusScreenState extends State<SubscriptionStatusScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _getPackageName(String? packageId) {
    switch (packageId) {
      case '1':
        return 'Silver Plan';
      case '2':
        return 'Gold Plan';
      case '3':
        return 'Platinum Plan';
      default:
        return 'Free Plan';
    }
  }

  Color _getPackageColor(String? packageId) {
    switch (packageId) {
      case '1':
        return Colors.grey[300]!;
      case '2':
        return Colors.amber;
      case '3':
        return Colors.grey[850]!;
      default:
        return Colors.grey;
    }
  }

  IconData _getPackageIcon(String? packageId) {
    switch (packageId) {
      case '1':
        return Icons.workspace_premium;
      case '2':
        return Icons.star;
      case '3':
        return Icons.diamond;
      default:
        return Icons.card_membership;
    }
  }

  @override
  Widget build(BuildContext context) {
    String packageName = _getPackageName(widget.user.packageId);
    Color packageColor = _getPackageColor(widget.user.packageId);
    IconData packageIcon = _getPackageIcon(widget.user.packageId);

    String expiryDate = widget.user.exp != null && widget.user.exp!.isNotEmpty
        ? DateFormat('MMM dd, yyyy').format(DateTime.parse(widget.user.exp!))
        : 'Never';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.1),
              Colors.white.withOpacity(0.9),
            ],
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: packageColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          packageIcon,
                          size: 48,
                          color: packageColor,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        packageName,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: packageColor,
                                ),
                      ),
                      // const SizedBox(height: 8),
                      // Text(
                      //   'Package ID: ${widget.user.packageId ?? "N/A"}',
                      //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      //         color: Colors.grey[600],
                      //       ),
                      // ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.event,
                            color: Colors.grey[600],
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Expires on:',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        expiryDate,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
