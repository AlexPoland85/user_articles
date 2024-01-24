import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_articles/data/remote_data_sources/authors_remote_data_source.dart';
import 'package:user_articles/domain/models/author_model.dart';
import 'package:user_articles/domain/repositories/authors_repository.dart';

class MockAuthorsDataSource extends Mock
    implements AuthorsRemoteRetroFitDataSource {}

void main() {
  late AuthorsRepository sut;
  late MockAuthorsDataSource dataSource;

  setUp(() {
    dataSource = MockAuthorsDataSource();
    sut = AuthorsRepository(remoteDataSource: dataSource);
  });

  group(
    'getAuthorModels',
    () {
      test('should call remoteDataSource.getAuthors() method', () async {
        //1
        when(() => dataSource.getAuthors()).thenAnswer(
          (_) async => [],
        );
        //2
        await sut.getAuthorModels();
        //3
        verify(() => dataSource.getAuthors()).called(1);
      });
      test(
        'should filter data source results with provided author id',
        () async {
          //1
          when(() => dataSource.getAuthors()).thenAnswer(
            (_) async => [
              AuthorModel(1, 'picture1', 'Tomasz', 'Jażyna'),
              AuthorModel(2, 'picture2', 'Lidia', 'Czapla'),
              AuthorModel(3, 'picture3', 'Łukasz', 'Kom'),
              AuthorModel(4, 'picture4', 'Klaudia', 'Nerka'),
            ],
          );
          //2
          final result = await sut.getAuthorModels();
          //3
          expect(result, [
            AuthorModel(1, 'picture1', 'Tomasz', 'Jażyna'),
            AuthorModel(2, 'picture2', 'Lidia', 'Czapla'),
            AuthorModel(3, 'picture3', 'Łukasz', 'Kom'),
            AuthorModel(4, 'picture4', 'Klaudia', 'Nerka'),
          ]);
        },
      );
    },
  );
}
