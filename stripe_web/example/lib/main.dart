import 'package:flutter/material.dart';
import 'package:stripe_web/stripe_web.dart';
import 'screens/screens.dart';
import '.env.dart';
import 'widgets/dismiss_focus_overlay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DismissFocusOverlay(
      child: MaterialApp(
      //  theme: ThemeData.light(),
      //  theme: ThemeData.dark(),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Column(children: [
        ...ListTile.divideTiles(
          context: context,
          tiles: [
            for (final example in Example.values)
              ListTile(
                onTap: () {
                  final route = MaterialPageRoute(builder: example.builder);
                  Navigator.push(context, route);
                },
                title: Text(example.title),
                trailing: Icon(
                  Icons.chevron_right_rounded,
                ),
              ),
          ],
        ),
      ]),
    );
  }
}