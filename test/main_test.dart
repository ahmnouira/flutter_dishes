import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dishes/main.dart' as main_app;

void main() {
  group('Testing the root widget', () {
    testWidgets("Making sure that 'main()' doesn't throw",
        (WidgetTester tester) async {
      var throws = false;
      try {
        main_app.main();
      } catch (e) {
        throws = true;
      }
      expect(throws, isFalse);
    });
  });
}
