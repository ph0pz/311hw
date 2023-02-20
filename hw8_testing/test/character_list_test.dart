import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cs311hw08/character_list.dart';
import 'package:cs311hw08/character_detail.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'character_list_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
// Define a test. The TestWidgets function also provides a WidgetTester
// to work with. The WidgetTester allows you to build and interact
// with widgets in the test environment.
  testWidgets(
      'CharacterList should show list of characters and scrollable',
          (tester) async {
        final client = MockClient();
        when(client.get(Uri.parse('https://api.genshin.dev/characters')))
            .thenAnswer((_) async => Future.delayed(
            const Duration(seconds: 1),
                () => http.Response(
                '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]',
                200)));
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: CharacterList(client: client),
          ),
        ));
        await tester.pumpAndSettle();
        final findListView = find.byType(ListView);
        final listFinder = find.byType(Scrollable);
        await tester.scrollUntilVisible(
          findListView,
          500.0,
          scrollable: listFinder,
        );
        await tester.pump();
        expect(findListView, findsOneWidget);
      });

  testWidgets('CharacterList should tap',
          (tester) async {
        final client = MockClient();
        when(client.get(Uri.parse('https://api.genshin.dev/characters')))
            .thenAnswer((_) async => Future.delayed(
            const Duration(seconds: 1),
                () => http.Response(
                '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]',
                200)));
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: CharacterList(client: client),
          ),
        ));
        await tester.pumpAndSettle();
        final findFirstListTile = find.byType(ListTile).first;
        await tester.tap(findFirstListTile);
        await tester.pumpAndSettle();

        expect(find.byType(CharacterDetail), findsOneWidget);
      });

  testWidgets('CharacterList should show error text', (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => http.Response('Not Found', 404));

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CharacterList(client: client),
      ),
    ));
    await tester.pumpAndSettle();
    final findTextErr = find.byType(Text);
    expect(findTextErr, findsOneWidget);
  });
}