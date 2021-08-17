/// * Dart-define arguments
///
/// Arguments from command-line attribute `--dart-define`
/// e.g. flutter run --dart-define=API_HOST=http://sample.test/
///

const configBaseUri = String.fromEnvironment('API_BASE_URI');
const configCameraAccount = String.fromEnvironment('C_ACC');
const configCameraPwd = String.fromEnvironment('C_PWD');
const configUserAccount = String.fromEnvironment('USR_ACC');
const configUserPwd = String.fromEnvironment('USR_PWD');
