import 'package:supabase_flutter/supabase_flutter.dart';

class ServiceProvidersDatabase {
  final database = Supabase.instance.client.from('service_providers');

  Future<List<Map<String, dynamic>>> getProviders({
    required final service,
  }) async {
    final response = await database
        .select()
        .contains('services_offered', [service.toString()])
        .order('rating', ascending: false);

    final data = response;
    return data;
  }
}
