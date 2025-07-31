abstract class Failure {
  final String error;

  Failure({required this.error});
}
class ServerFail extends Failure{
  ServerFail({required super.error});

}