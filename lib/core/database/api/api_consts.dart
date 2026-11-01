import 'package:envied/envied.dart';
part 'api_consts.g.dart';

@envied
abstract class ApiConsts {
    @EnviedField(varName: 'BASE_URL')
    static const String baseUrl = _ApiConsts.baseUrl;
        @EnviedField(varName: 'FACTS_ENDPOINT')
    static const String factsEndpoint = _ApiConsts.factsEndpoint;
          @EnviedField(varName: 'BREEDS_ENDPOINT')
    static const String breedsEndpoint = _ApiConsts.breedsEndpoint;
}