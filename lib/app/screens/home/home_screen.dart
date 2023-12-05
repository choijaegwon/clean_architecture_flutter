import 'package:clean_architecture_flutter/app/screens/home/home_controller.dart';
import 'package:clean_architecture_flutter/data/data_users_repository.dart';
import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePage extends View {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomeState(HomeController(
        DataUsersRepository(),
      ));
}

class HomeState extends ViewState<HomePage, HomeController> {
  HomeState(HomeController controller) : super(controller);

  @override
  Widget get view => MaterialApp(
        title: 'Clean Architecture Demo',
        home: Scaffold(
          key: globalKey,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: ControlledWidgetBuilder<HomeController>(
                    builder: (context, controller) {
                  return FutureBuilder(
                    future: controller.userCompleter.future,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Column(
                          children: [
                            CircularProgressIndicator(),
                            ElevatedButton(
                              onPressed: () {
                                controller.getUser('test-uid');
                              },
                              child: Text('testButton onTap'),
                            ),
                          ],
                        );
                      }

                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                snapshot.data!.name,
                                style: TextStyle(color: Colors.red),
                              ),
                              Text(
                                controller.counter.toString(),
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              controller.counterUp();
                            },
                            child: Text('counter UpTap'),
                          ),
                        ],
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      );
}
