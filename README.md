# Esp8266 + CO2 meter
---

Have the webserver, Over-The-Air firmware updating, SNTP time, IoT cloud ([http://thingspeak.com](http://thingspeak.com)).

Gathering information from CO2 sensor AZ 7798 and controls Aeropac SN.

![alt tag](https://github.com/vad7/CO2UART/blob/master/main_screen.jpg)


WiFi модуль esp8266 используется в качестве веб-сервера для беспроводного управления проветривателем (Aeropaс SN) через nRF24L01+.
Собранные значения углекислого газа, температуры, влажности с датчика AZ-7798 отправляются на облачный сервер интернета вещей - <a href="http://thingspeak.com">ThingSpeak</a>

Схема получается такой - с датчика CO2 через TTL esp8266 получает данные CO2, температуру, влажность и расчитывает нужную производительность проветривания. 
Микроконтроллер Atmel AVR ATtiny44A, подключенный к Aeropac SN шлет запрос через nRF24L01 на такой-же модуль, подключенный к esp8266 и получает на какую скорость нужно включить проветриватель. 
Точное время берется через SNTP, и в зависимости от времени суток корректируются обороты вентиляторов.

График c зумом строится с помощью open-source библиотеки <a href="http://d3js.org">d3j (Data-Driven Documents)</a> :

![alt tag](https://github.com/vad7/WirelessCO2_esp8266/blob/master/history_screen.jpg)

Schematics: 
![SCH](https://github.com/vad7/CO2UART/blob/master/WirelessCO2-TTL.jpg)

![SCH](https://github.com/vad7/CO2UART/blob/master/AeropacSN/WirelessCO2Fan_Keys.jpg)

Based on [PowerMeter](https://github.com/vad7/PowerMeter.git)
