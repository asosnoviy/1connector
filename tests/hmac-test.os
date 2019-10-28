#Использовать asserts
#Использовать "../src"

Функция ПолучитьСписокТестов(МенеджерТестирования) Экспорт
	
	МассивТестов = Новый Массив;
	МассивТестов.Добавить("ТестДолжен_ПроверитьЧтоРаботаетВычислениеHMACПоАлгоритмуMD5");
	МассивТестов.Добавить("ТестДолжен_ПроверитьЧтоРаботаетВычислениеHMACПоАлгоритмуSHA1");
	МассивТестов.Добавить("ТестДолжен_ПроверитьЧтоРаботаетВычислениеHMACПоАлгоритмуSHA256");
	
	Возврат МассивТестов;

КонецФункции

Процедура ТестДолжен_ПроверитьЧтоРаботаетВычислениеHMACПоАлгоритмуMD5() Экспорт
	
	Результат = КоннекторHTTP.HMAC(Ключ(), ПустыеДанные(), ХешФункция.MD5);
	Ожидаем.Что(Результат).Равно(ПолучитьДвоичныеДанныеИзHexСтроки("1b1ec4166a11c03b3afefaea442e7709"));
	
	Результат = КоннекторHTTP.HMAC(КлючБольше64(), Данные(), ХешФункция.MD5);
	Ожидаем.Что(Результат).Равно(ПолучитьДвоичныеДанныеИзHexСтроки("ed5b2d6b9f573cd46e8f8d1d1e8b70e3"));

КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтоРаботаетВычислениеHMACПоАлгоритмуSHA1() Экспорт
	
	Результат = КоннекторHTTP.HMAC(Ключ(), ПустыеДанные(), ХешФункция.SHA1);
	Ожидаем.Что(Результат).Равно(ПолучитьДвоичныеДанныеИзHexСтроки("355aa0587050d711f4ca9af6930c736363a88d34"));
	
	Результат = КоннекторHTTP.HMAC(КлючБольше64(), Данные(), ХешФункция.SHA1);
	Ожидаем.Что(Результат).Равно(ПолучитьДвоичныеДанныеИзHexСтроки("7e8f9d7ebbe81e508a39f410e157fc6e714b3371"));

КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтоРаботаетВычислениеHMACПоАлгоритмуSHA256() Экспорт
	
	Результат = КоннекторHTTP.HMAC(Ключ(), ПустыеДанные(), ХешФункция.SHA256);
	Ожидаем.Что(Результат).Равно(
		ПолучитьДвоичныеДанныеИзHexСтроки("70907d03476d72b7276897718590a49f6ce56991112fb5a0e9ed41652b2aab6c"));
	
	Результат = КоннекторHTTP.HMAC(КлючБольше64(), Данные(), ХешФункция.SHA256);
	Ожидаем.Что(Результат).Равно(
		ПолучитьДвоичныеДанныеИзHexСтроки("80be8107de7879f028c8bfe97e10b859785530dd19dfc41a4d6962ce4c2fc130"));

КонецПроцедуры


Функция Ключ()

	Возврат ПолучитьДвоичныеДанныеИзСтроки("Секретный ключ", КодировкаТекста.UTF8, Ложь);

КонецФункции

Функция КлючБольше64()

	Возврат ПолучитьДвоичныеДанныеИзСтроки(
		"1234567890123456789012345678901234567890123456789012345678901234567890", КодировкаТекста.UTF8, Ложь);

КонецФункции

Функция ПустыеДанные()

	Возврат ПолучитьДвоичныеДанныеИзСтроки("", КодировкаТекста.UTF8, Ложь);

КонецФункции

Функция Данные()

	Возврат ПолучитьДвоичныеДанныеИзСтроки("Какие-то данные", КодировкаТекста.UTF8, Ложь);

КонецФункции