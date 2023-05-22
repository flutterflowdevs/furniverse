import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get displayName => getField<String>('display_name');
  set displayName(String? value) => setField<String>('display_name', value);

  String? get displayImagee => getField<String>('display_imagee');
  set displayImagee(String? value) => setField<String>('display_imagee', value);

  int? get phoneNumber => getField<int>('phone_number');
  set phoneNumber(int? value) => setField<int>('phone_number', value);

  String? get currency => getField<String>('currency');
  set currency(String? value) => setField<String>('currency', value);

  String? get language => getField<String>('language');
  set language(String? value) => setField<String>('language', value);

  List<String> get isFavorite => getListField<String>('is_favorite');
  set isFavorite(List<String>? value) =>
      setListField<String>('is_favorite', value);

  String? get authId => getField<String>('auth_id');
  set authId(String? value) => setField<String>('auth_id', value);
}
