import 'package:amigo_fiel/widgets/features/maps.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/material.dart';

class FeedSpotInfo extends StatefulWidget {
  const FeedSpotInfo({
    super.key,
    required this.defaultBackgroundColor,
    required this.defaultIconColor,
  });

  final Color defaultBackgroundColor;
  final Color defaultIconColor;

  @override
  State<FeedSpotInfo> createState() => _FeedSpotInfoState();
}

class _FeedSpotInfoState extends State<FeedSpotInfo> with SingleTickerProviderStateMixin {
  final PanelController _pc = PanelController();
  bool isPanelVisible = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      hidePanel();
    });
  }

  void showPanel() {
    setState(() {
      isPanelVisible = true;
      _pc.show();
    });
  }

  void hidePanel() {
    setState(() {
      isPanelVisible = false;
      _pc.hide();
    });
  }

  void openPanel() {
    setState(() {
      isPanelVisible = true;
      _pc.open();
    });
  }

  void closePanel() {
    setState(() {
      isPanelVisible = false;
      _pc.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: _pc,
      backdropEnabled: true,
      color: widget.defaultBackgroundColor,
      boxShadow: const [BoxShadow(blurRadius: 8, color: Color.fromRGBO(0, 0, 0, 0.75))],
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      panel: Visibility(
        visible: isPanelVisible,
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
                        color: widget.defaultIconColor,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 200, // Defina uma altura adequada para o ListView
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 0,
                        itemBuilder: (context, index) {
                          String imageUrl = '';
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
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "LANDMARK",
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
                          "FULL ADDRESS",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    Divider(
                      height: 40,
                      thickness: 2,
                      color: widget.defaultIconColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        if ('Visitante' != 'Visitante')
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {},
                              child: const Text('Reportar'),
                            ),
                          ),
                        if ('Visitante' != 'Visitante') const SizedBox(width: 8),
                        if ('Visitante' != 'Visitante')
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Encher'),
                            ),
                          )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: MapsWidget(),
    );
  }
}
