import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_vadi_kurucu/oyun_vadi_kurucu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(vadiKurucuConfig.title.length, 33);
    expect(vadiKurucuConfig.tagline.length, 33);
    for (final s in vadiKurucuConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(vadiKurucuConfig.gameId, vadiKurucuId);
    expect(vadiKurucuRules.gameId, vadiKurucuId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(vadiKurucuRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: vadiKurucuId, optionalMechanics: vadiKurucuRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(vadiKurucuRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
