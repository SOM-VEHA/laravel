import 'package:flutter/material.dart';

import '../../../widget/CustomCellTile.dart';
import '../../../widget/CustomHeader.dart';
import '../../../widget/CustomSectionCard.dart';
import '../../../widget/CustomStatsRow.dart';
import 'StatsModel.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: CustomScrollView(
        // slivers: [
        //   ///Appbar
        //   SliverAppBar(
        //     pinned: true,
        //     backgroundColor: Colors.black,
        //     surfaceTintColor: Colors.transparent,
        //     elevation: 0,
        //     centerTitle: false,
        //     title: Text.rich(
        //       TextSpan(
        //         style: const TextStyle(
        //           fontWeight: FontWeight.w900,
        //           fontSize: 22,
        //           color: Colors.black,
        //         ),
        //         children: [
        //           TextSpan(text: 'Account',style: TextStyle(color: Colors.white)),
        //           TextSpan(
        //             text: '',
        //             style: TextStyle(color: Colors.deepOrange),
        //           ),
        //         ],
        //       ),
        //     ),
        //     actions: [
        //       IconButton(
        //         tooltip: 'Settings',
        //         onPressed: () {
        //
        //         },
        //         icon: const Icon(
        //           Icons.settings_outlined,
        //           color: Colors.black87,
        //         ),
        //       ),
        //       const SizedBox(width: 8),
        //     ],
        //   ),
        //   SliverPadding(
        //     padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        //     sliver: SliverList.list(
        //       children: [
        //         CustomHeader(
        //           name: "Somsak",
        //           email: "john.c.calhoun@examplepetstore.com",
        //           onEdit: (){},
        //         ),
        //         const SizedBox(height: 16),
        //         CustomStatsRow(
        //           items: [
        //             StatsModel(label: 'Orders', value: '12'),
        //             StatsModel(label: 'Wishlist', value: '8'),
        //             StatsModel(label: 'Coupons', value: '3'),
        //           ],
        //         ),
        //         const SizedBox(height: 16),
        //         CustomSectionCard(
        //           title: "My Activity",
        //           children: [
        //             CustomCellTile(
        //               icon: Icons.receipt_long_outlined,
        //               label: 'Orders',
        //               onTap: () {
        //
        //               },
        //               trailing: const Text('Track & history',style: TextStyle(color: Colors.white),),
        //             ),
        //             CustomCellTile(
        //               icon: Icons.favorite_border,
        //               label: 'Wishlist',
        //               onTap: () {},
        //               trailing: const Text('Saved items',style: TextStyle(color: Colors.white),),
        //             ),
        //             CustomCellTile(
        //               icon: Icons.rate_review_outlined,
        //               label: 'Reviews',
        //               onTap: () {},
        //               trailing: const Text('Your ratings',style: TextStyle(color: Colors.white),),
        //             ),
        //           ],
        //         ),
        //         const SizedBox(height: 16),
        //         CustomSectionCard(
        //           title: "Addresses & Payments",
        //           children: [
        //             CustomCellTile(
        //               icon: Icons.location_on_outlined,
        //               label: 'Addresses',
        //               onTap: () {
        //
        //               },
        //               trailing: const Text('Home, Work',style: TextStyle(color: Colors.white),),
        //             ),
        //             CustomCellTile(
        //               icon: Icons.credit_card_outlined,
        //               label: 'Payment Methods',
        //               onTap: () {},
        //               trailing: const Text('Visa •• 3123',style: TextStyle(color: Colors.white),),
        //             ),
        //             CustomCellTile(
        //               icon: Icons.local_shipping_outlined,
        //               label: 'Shipping',
        //               onTap: () {},
        //               trailing: const Text('Preferences',style: TextStyle(color: Colors.white),),
        //             ),
        //           ],
        //         ),
        //         const SizedBox(height: 16),
        //         CustomSectionCard(title: "Support", children: [
        //           CustomCellTile(
        //             icon: Icons.help_outline_rounded,
        //             label: 'Help Center',
        //             onTap: (){},
        //           ),
        //           CustomCellTile(
        //             icon: Icons.chat_bubble_outline_rounded,
        //             label: 'Contact Us',
        //             onTap: () {
        //
        //             },
        //             trailing: const Text('Email / Chat',style: TextStyle(color: Colors.white),),
        //           ),
        //           CustomCellTile(
        //             icon: Icons.info_outline_rounded,
        //             label: 'About',
        //             onTap: () {
        //
        //             },
        //           ),
        //         ]),
        //         const SizedBox(height: 16),
        //         _DangerCard(
        //           child: ListTile(
        //             leading: const Icon(
        //               Icons.logout_rounded,
        //               color: Colors.white,
        //             ),
        //             title: const Text(
        //               'Log Out',
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontWeight: FontWeight.w700,
        //               ),
        //             ),
        //             onTap: () async {
        //               final confirm = await showDialog<bool>(
        //                 context: context,
        //                 builder: (_) => AlertDialog(
        //                   title: const Text('Log out?'),
        //                   content: const Text(
        //                     'You’ll need to sign in again to access your account.',
        //                   ),
        //                   actions: [
        //                     TextButton(
        //                       onPressed: () => Navigator.pop(context, false),
        //                       child: const Text('Cancel'),
        //                     ),
        //                     FilledButton(
        //                       onPressed: () => Navigator.pop(context, true),
        //                       style: FilledButton.styleFrom(
        //                         backgroundColor: Colors.red,
        //                       ),
        //                       child: const Text('Log Out'),
        //                     ),
        //                   ],
        //                 ),
        //               );
        //               if (confirm == true) {
        //                // authController.logout();
        //               }
        //             },
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(16),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
      ),
    );
  }
}
class _DangerCard extends StatelessWidget {
  const _DangerCard({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(color: const Color(0xFFFFE0E0)),
        color:  Colors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}