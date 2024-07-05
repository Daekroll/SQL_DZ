/*
1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DELIMITER $$
CREATE FUNCTION convert_seconds_to_daystime(secondsINT INT)
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
	DECLARE daysINT INT DEFAULT 0;
    DECLARE hoursINT INT DEFAULT 0;
    DECLARE minutesINT INT DEFAULT 0;
    DECLARE res VARCHAR(200) DEFAULT '';
    DECLARE daysCHAR VARCHAR(200) DEFAULT '';
    DECLARE hoursCHAR VARCHAR(200) DEFAULT '';
    DECLARE minutesCHAR VARCHAR(200) DEFAULT '';
    DECLARE secondsCHAR VARCHAR(200) DEFAULT '';
			SET daysINT = secondsINT DIV 86400;
            SET secondsINT  = secondsINT  - (daysINT * 86400);
            SET hoursINT = secondsINT DIV 3600;
            SET secondsINT  = secondsINT  - (hoursINT * 3600);
            SET minutesINT = secondsINT DIV 60;
            SET secondsINT  = secondsINT  - (minutesINT * 60);
            SET daysCHAR = CONCAT(daysINT,' days ');
            SET hoursCHAR = CONCAT(hoursINT,' hours ');
            SET minutesCHAR = CONCAT(minutesINT,' minutes ');
            SET secondsCHAR = CONCAT(secondsINT,' seconds ');
            SET res = CONCAT(CONCAT(daysCHAR, hoursCHAR),CONCAT(minutesCHAR, secondsCHAR));
    RETURN res;
END $$
DELIMITER ;

SELECT convert_seconds_to_daystime(123456); -- Вызов функции с аргументом (секунды) в скобках.


/*
2. Выведите только чётные числа от 1 до 10.
Пример: 2,4,6,8,10
*/

DELIMITER $$
CREATE PROCEDURE even_numbers(x INT)
BEGIN
	DECLARE num INT DEFAULT 0;
	DECLARE res VARCHAR(200) DEFAULT '';
    IF x < 2 THEN
		SET res = '';
	ELSE
		SET num = 2;
		REPEAT
			SET res = CONCAT(res, num, ' ');
			SET num = num + 2;
			UNTIL num > x
		END REPEAT;
	END IF;
	SELECT res;
END $$
DELIMITER ;

DROP PROCEDURE even_numbers;

SELECT CAST(100 AS NCHAR(50));

CALL even_numbers(20); -- Вызов процедуры с аргументом(число) до которого будут выводиться четные значения.
