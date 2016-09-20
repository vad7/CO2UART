# Esp8266 + nRF24L01
---

Have the webserver, Over-The-Air firmware updating, SNTP time, IoT cloud ([http://thingspeak.com](http://thingspeak.com)).

Gathering information from [CO2 sensor with nRF24L01](http://we.easyelectronics.ru/smarthouse/dorabotka-provetrivatelya-ili-upravlenie-ventilyaciey-ot-datchika-uglekislogo-gaza.html) and controls ventilation fans.

![alt tag](https://github.com/vad7/WirelessCO2_esp8266/blob/master/main_screen.jpg)


WiFi модуль esp8266 используется в качестве веб-сервера для беспроводного управления вентиляцией через nRF24L01+.
Вот в эту <a href="http://we.easyelectronics.ru/smarthouse/dorabotka-provetrivatelya-ili-upravlenie-ventilyaciey-ot-datchika-uglekislogo-gaza.html">конструкцию</a> добавляется WiFi модуль, который выполняет роль "мозга" системы вентиляции.
Собранные значения углекислого газа отправляются на облачный сервер интернета вещей - <a href="http://thingspeak.com">ThingSpeak</a>

Схема получается такой - с датчика CO2 микроконтроллером Atmel AVR ATtiny44A получаем уровень CO2, далее по воздуху, с помощью nRF24L01 передаем его на esp8266. 
Esp8266, в свою очередь, считает необходимую скорость вентиляторов и передает ее через тот-же nRF24L01 на проветриватели и вентиляторы.
Точное время берется через SNTP, и в зависимости от времени суток корректируются обороты вентиляторов.

График c зумом строится с помощью open-source библиотеки <a href="http://d3js.org">d3j (Data-Driven Documents)</a> :

![alt tag](https://github.com/vad7/WirelessCO2_esp8266/blob/master/history_screen.jpg)

В качестве веб-сервера используется библиотека <a href="https://github.com/pvvx/esp8266web">esp8266web</a>, которая немного доработана:

<ol>
<li>Сделано обновление прошивки по WiFi (firmware.bin). Загружается на место Web диска, затем при загрузке (<a href="https://github.com/vad7/Rapid_Loader_OTA">Rapid_Loader_OTA</a>) копируется на основное место.</li>
<li>Добавлена функция записи в Web диск - WEBFSUpdateFile. Исправлены ошибки в библиотеке WEBFS (web/webfs.c).</li>
<li>Увеличен лимит для размера при сохранении переменных, cookies в web_int_vars (функции web_parse_*).</li>
<li>Уменьшен до 1 сектора (4096 байт) блок сохранения конфигурации в 0x7B000 (flash_epp), сохранение/восстановление конфигурации, добавлена функция current_cfg_length().</li>
<li>Исправление потерю соединения к некоторым роутерам и отсутствие пере-подключения.</li>
<li>Отладка в RAM память.</li>
<li>и другие небольшие доработки</li>
</ol>

Написан <a href="https://github.com/vad7/nrf24l01_esp8266">драйвер nRF24L01</a>, который использует блочное чтение/запись через HSPI на esp8266.

Schematic: 
![SCH](https://github.com/vad7/WirelessCO2_esp8266/blob/master/WirelessCO2.jpg)

VCC - 3.3V<br> 

ESP-07 module: 

![alt tag](https://github.com/vad7/WirelessCO2_esp8266/blob/master/esp-07.jpg)

Based on [PowerMeter](https://github.com/vad7/PowerMeter.git)
