import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "2 NEW",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TODAY",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Mark all as read"),
                  ),
                ],
              ),
            ),

            const NotificationItem(
              title: "Product Review Request",
              subtitle:
                  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus nihil tenetur saepe.",
              time: "1h",
              icon: Icons.favorite_outline_rounded,
            ),

            const NotificationItem(
              title: "Order Shipped",
              subtitle:
                  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus nihil tenetur saepe.",
              time: "1h",
              icon: Icons.local_shipping_outlined,
            ),

            const NotificationItem(
              title: "Product Review Request",
              subtitle:
                  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus nihil tenetur saepe.",
              time: "1h",
              icon: Icons.favorite_outline_rounded,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "YESTERDAY",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Mark all as read"),
                  ),
                ],
              ),
            ),

            const NotificationItem(
              title: "Order Shipped",
              subtitle:
                  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus nihil tenetur saepe.",
              time: "1d",
              icon: Icons.local_shipping_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;

  const NotificationItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromRGBO(246, 246, 246, 1),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 28,
                ),
              ),
              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const Divider(thickness: 1, color: Color.fromRGBO(228, 228, 228, 1)),
      ],
    );
  }
}
