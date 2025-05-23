import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_http/user_model.dart';
import 'package:user_http/user_repository.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;
  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(mockHTTPClient);
  });
  group('UserRepository - ', () {
    group('getUser function - ', () {
      test(
        'given UserRepository class when getUser funtion is called and status code is 200 then a usermodel should be returned',
        () async {
          //arange
          when(
            () => mockHTTPClient.get(
              Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
            ),
          ).thenAnswer((invocation) async{
            return Response(
              '''
              {
                "id": 1,
                "name": "Leanne Graham",
                "email": "Sincere@april.biz",
                "website": "hildegard.org"
              }
              ''', 
              200
            );
          });
          //act
          final user = await userRepository.getUser();
          //assert
          expect(user, isA<User>());
        },
      );

      test(
        'given UserRepository class when getUser funtion is called and status code is not 200 then an exception should be thrown',
        () async {
          //arange
          when(
            () => mockHTTPClient.get(
              Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
            ),
          ).thenAnswer((invocation) async => Response('{}',500));
          //act
          final user = userRepository.getUser();
          //assert
          expect(user, throwsException);
        },
      );
    });
  });
}
