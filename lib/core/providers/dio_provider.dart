import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();

  // Configure base options
  dio.options = BaseOptions(
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    // Allow all status codes < 500 to be handled by interceptors
    validateStatus: (status) => status != null && status < 500,
  );

  // Add redirect handler interceptor for Google Apps Script
  dio.interceptors.add(
    InterceptorsWrapper(
      onResponse: (response, handler) async {
        // Handle 302 redirects from Google Apps Script
        if (response.statusCode == 302) {
          final String? redirectUrl = response.headers.value('location');

          if (redirectUrl != null) {
            log('[DIO] 302 Redirect detected. Following to: $redirectUrl');

            try {
              // Follow the redirect and get the actual data
              final redirectResponse = await dio.get(
                redirectUrl,
                options: Options(
                  contentType: Headers.jsonContentType,
                  headers: {'Accept': 'application/json'},
                ),
              );

              // Return the redirect response as if it was the original response
              handler.resolve(redirectResponse);
              return;
            } catch (e) {
              log('[DIO] Error following redirect: $e');
              handler.reject(
                DioException(
                  requestOptions: response.requestOptions,
                  error: 'Failed to follow redirect: $e',
                ),
              );
              return;
            }
          }
        }

        // Pass through for all other responses
        handler.next(response);
      },
      onError: (error, handler) {
        log('[DIO] Error: ${error.message}');
        handler.next(error);
      },
    ),
  );

  // Add interceptor for logging (optional)
  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (object) {
        log(object.toString());
      },
    ),
  );

  return dio;
});
