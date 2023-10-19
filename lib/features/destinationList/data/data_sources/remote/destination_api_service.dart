import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/constants.dart';
import 'package:dio/dio.dart';
import '../../models/destination.dart';

part 'destination_api_service.g.dart';

@RestApi(baseUrl: destinationAPIBaseURL)
abstract class DestinationApiService {
  factory DestinationApiService(Dio dio) = _DestinationApiService;

  @GET('/get-destination')
  Future<HttpResponse<List<DestinationModel>>> getDestination();
}
