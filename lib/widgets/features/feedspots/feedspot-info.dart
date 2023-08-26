import 'package:amigo_fiel/services/controllers/feedspot-controller.dart';
import 'package:amigo_fiel/services/controllers/panel-controller.dart';
import 'package:amigo_fiel/services/controllers/user-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FeedSpotPanel extends StatelessWidget {
  const FeedSpotPanel({
    Key? key,
    required this.defaultIconColor,
  }) : super(key: key);

  final Color defaultIconColor;

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    final panelController = Get.put(PanelControllerMixin());
    return GetX<FeedspotController>(
      builder: (controller) {
        final feedspot = controller.feedspot;
        final user = userController.loggedUser;

        return Visibility(
          visible: panelController.isVisible,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 3,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: defaultIconColor,
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: feedspot?.images?.length ?? 0,
                          itemBuilder: (context, index) {
                            String imageUrl = feedspot?.images?[index].imageUrl ?? '';
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.network(
                                imageUrl,
                                width: 500,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${feedspot?.landmark}",
                                style: Theme.of(context).textTheme.headlineLarge,
                              ),
                              const Spacer(),
                              Row(
                                children: const [
                                  Icon(Icons.star, color: Colors.amber),
                                  Icon(Icons.star, color: Colors.amber),
                                  Icon(Icons.star, color: Colors.amber),
                                  Icon(Icons.star, color: Colors.amber),
                                  Icon(Icons.star, color: Colors.amber),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "${feedspot?.fullAddress}",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                      Divider(
                        height: 40,
                        thickness: 2,
                        color: defaultIconColor,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          if (user?.id != null)
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                child: const Text('Reportar'),
                              ),
                            ),
                          if (user?.id != null) const SizedBox(width: 8),
                          if (user?.id != null)
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Encher'),
                              ),
                            )
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
