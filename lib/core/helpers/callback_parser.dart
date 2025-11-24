import 'dart:convert';
import 'dart:developer';

/// Helper class for parsing Google Apps Script callback responses
class CallbackParser {
  /// Parses response data that may be wrapped in a callback function
  ///
  /// Example input: `callback({"status": "success", "data": {...}})`
  /// Returns: `{"status": "success", "data": {...}}`
  static Map<String, dynamic> parse(dynamic responseData) {
    try {
      // If already a Map, return it directly
      if (responseData is Map<String, dynamic>) {
        log('[CallbackParser] Response is already a Map');
        return responseData;
      }

      // Convert to string for processing
      String jsonString = responseData.toString();
      log('[CallbackParser] Original response: $jsonString');

      // Remove callback wrapper if it exists
      if (jsonString.startsWith('callback(') && jsonString.endsWith(')')) {
        jsonString = jsonString.substring(9, jsonString.length - 1);
        log('[CallbackParser] Stripped callback wrapper: $jsonString');
      }

      // Parse the JSON string
      if (jsonString.startsWith('{') && jsonString.endsWith('}')) {
        final parsed = jsonDecode(jsonString) as Map<String, dynamic>;
        log('[CallbackParser] Successfully parsed JSON');
        return parsed;
      } else {
        throw FormatException(
          'Response is not a valid JSON object: $jsonString',
        );
      }
    } catch (e) {
      log('[CallbackParser] Error parsing response: $e');
      rethrow;
    }
  }

  /// Safely parses response data and returns null if parsing fails
  static Map<String, dynamic>? tryParse(dynamic responseData) {
    try {
      return parse(responseData);
    } catch (e) {
      log('[CallbackParser] Failed to parse response: $e');
      return null;
    }
  }

  /// Removes callback wrapper from string without parsing JSON
  static String removeCallbackWrapper(String response) {
    if (response.startsWith('callback(') && response.endsWith(')')) {
      return response.substring(9, response.length - 1);
    }
    return response;
  }
}
