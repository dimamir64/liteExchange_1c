#Область СтандартныеПеременныеИФункции
Перем ОбработкаВыполненаУспешно Экспорт;
Перем ОписаниеОшибки Экспорт;
Перем ВходящиеДанные Экспорт;
Перем ПараметрыЗапроса Экспорт;
Перем ЗаголовкиЗапроса Экспорт;
Перем ПараметрыУРЛ Экспорт;
#КонецОбласти

Функция ВыполнитьОбработкуПриложения() Экспорт
	ВозвращаемыеДанные = "ОК";
	//Если ПараметрыЗапроса.Свойство("action") Тогда
	//	Если ПараметрыЗапроса.action = "nomenclature" Тогда
	//		//•	Получить регистрационные данные компании
	//		ВозвращаемыеДанные = ПолучитьДанныеОНоменклатуре();
	//	КонецЕсли;
	//КонецЕсли;
	
	леРаботаСJSON.ВосстановитьОбъект1сИзСтруктуры();
	
	Возврат ВозвращаемыеДанные;
КонецФункции

#Область ПользовательскиеФункции
//Функция ВосстановитьОбъектИзСтруктуры()
//	Тип = ВходящиеДанные.Тип;
//	ИмяТипа = СтрРазделить(Тип,".")[1];
//	Если Найти(Тип, "Справочник") Тогда		
//		Менеджер = Справочники[ИмяТипа];
//	ИначеЕсли Найти(Тип, "Документ") Тогда
//		Менеджер = Документы[ИмяТипа];
//	КонецЕсли;
//	
//	Ссылка = Менеджер.ПолучитьСсылку(Новый УникальныйИдентификатор(ВходящиеДанные.Ссылка));
//	Объект = Ссылка.ПолучитьОбъект();
//	
//	Если Объект = Неопределено Тогда
//		Если Найти(Тип, "Справочник") Тогда		
//			Если ВходящиеДанные.СтандартныеРеквизиты.Свойство("ЭтоГруппа")
//				и ВходящиеДанные.СтандартныеРеквизиты.ЭтоГруппа Тогда
//				Объект = Справочники[ИмяТипа].СоздатьГруппу();
//			Иначе
//				Объект = Справочники[ИмяТипа].СоздатьЭлемент();
//			КонецЕсли;
//		ИначеЕсли Найти(Тип, "Документ") Тогда
//			Объект = Документы[ИмяТипа].СоздатьДокумент();
//		КонецЕсли;
//		Объект.УстановитьСсылкуНового(Ссылка);
//	КонецЕсли;
//	
//	ЗаполнитьСсылки(ВходящиеДанные.Реквизиты);	
//	ЗаполнитьЗначенияСвойств(Объект, ВходящиеДанные.Реквизиты);
//	
//	Для Каждого ТЧ Из ВходящиеДанные.ТЧ Цикл
//		Объект[ТЧ.Ключ].Очистить();
//		Для Каждого Строка Из ТЧ.Значение Цикл
//			ЗаполнитьСсылки(Строка);	
//			НоваяСтрока = Объект[ТЧ.Ключ].Добавить();
//			ЗаполнитьЗначенияСвойств(НоваяСтрока, Строка);
//		КонецЦикла;
//	КонецЦикла;
//	
//	Если Найти(Тип, "Справочник") Тогда		
//		Если ВходящиеДанные.СтандартныеРеквизиты.Свойство("Код") Тогда
//			Объект.Код = ВходящиеДанные.СтандартныеРеквизиты.Код;
//		КонецЕсли;
//		Если ВходящиеДанные.СтандартныеРеквизиты.Свойство("Наименование") Тогда
//			Объект.Наименование = ВходящиеДанные.СтандартныеРеквизиты.Наименование;
//		КонецЕсли;
//		Если ВходящиеДанные.СтандартныеРеквизиты.Свойство("Владелец") Тогда
//			Объект.Владелец = ВходящиеДанные.СтандартныеРеквизиты.Владелец;
//		КонецЕсли;
//		Если ВходящиеДанные.СтандартныеРеквизиты.Свойство("Родитель") Тогда
//			Объект.Родитель = ВходящиеДанные.СтандартныеРеквизиты.Родитель;
//		КонецЕсли;		
//	ИначеЕсли Найти(Тип, "Документ") Тогда		
//		Объект.Дата = леРаботаСJSON.ПолучитьДатуИзСтроки(ВходящиеДанные.СтандартныеРеквизиты.Дата);
//		Объект.Проведен = ВходящиеДанные.СтандартныеРеквизиты.Проведен;
//		Объект.Номер = ВходящиеДанные.СтандартныеРеквизиты.Номер;
//		Объект.ПометкаУдаления = ВходящиеДанные.СтандартныеРеквизиты.ПометкаУдаления;
//	КонецЕсли;	
//	
//	Объект.ОбменДанными.Загрузка = Истина;
//	Объект.Записать();
//КонецФункции

//Функция ЗаполнитьСсылки(Реквизиты)
//	Для Каждого Элемент Из Реквизиты Цикл
//		Если ТипЗнч(Элемент.Значение) = Тип("Структура") Тогда
//			ИмяТипа = СтрРазделить(Элемент.Значение.Тип, ".")[1];
//			Значение = Элемент.Значение;			
//			Если Не ЗначениеЗаполнено(Значение) Тогда
//				Значение = Неопределено;
//			Иначе
//				Если Найти(Значение.Тип, "Справочник") Тогда
//					Значение = Справочники[ИмяТипа].ПолучитьСсылку(Новый УникальныйИдентификатор(Значение.Ссылка));				
//				ИначеЕсли Найти(Значение.Тип, "Документ") Тогда
//					Значение = Документы[ИмяТипа].ПолучитьСсылку(Новый УникальныйИдентификатор(Значение.Ссылка));				
//				ИначеЕсли Найти(Значение.Тип, "Перечисление") Тогда
//					ЗначенияПеречисления = Метаданные.Перечисления[ИмяТипа].ЗначенияПеречисления;
//					Для Каждого ЗначениеПеречисления Из ЗначенияПеречисления Цикл
//						Если ЗначениеПеречисления.Синоним = Значение.Представление Тогда
//							Значение = Перечисления[ИмяТипа][ЗначениеПеречисления.Имя];
//							Прервать;
//						КонецЕсли;
//					КонецЦикла;
//				КонецЕсли;
//			КонецЕсли;			
//			Реквизиты.Вставить(Элемент.Ключ, Значение);
//		КонецЕсли;
//	КонецЦикла;
//КонецФункции
#КонецОбласти

ОбработкаВыполненаУспешно = Истина;
ОписаниеОшибки = "";