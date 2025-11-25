import 'package:flutter_test/flutter_test.dart';
import 'package:movuni/services/rating_service.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

void main() {
  late RatingService ratingService;
  late FakeFirebaseFirestore fakeFirestore;

  setUp(() {
    fakeFirestore = FakeFirebaseFirestore();
    ratingService = RatingService(firestore: fakeFirestore);
  });

  group('RatingService - Validaciones', () {
    test('Debe lanzar error si la calificación es menor a 1', () async {
      expect(
        () => ratingService.createRating(
          tripId: 'trip123',
          ratedUserId: 'user1',
          raterUserId: 'user2',
          rating: 0.5,
        ),
        throwsA(isA<Exception>()),
      );
    });

    test('Debe lanzar error si la calificación es mayor a 5', () async {
      expect(
        () => ratingService.createRating(
          tripId: 'trip123',
          ratedUserId: 'user1',
          raterUserId: 'user2',
          rating: 6.0,
        ),
        throwsA(isA<Exception>()),
      );
    });

    test('Debe lanzar error si un usuario intenta calificarse a sí mismo', () async {
      expect(
        () => ratingService.createRating(
          tripId: 'trip123',
          ratedUserId: 'user1',
          raterUserId: 'user1',
          rating: 5.0,
        ),
        throwsA(isA<Exception>()),
      );
    });
  });
}
