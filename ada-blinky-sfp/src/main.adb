with Ada.Real_time; use Ada.Real_Time;
with Leds; use Leds; 

procedure Main is
   Duration : constant Time_Span := Milliseconds(100);
begin

   Led_Init;

   loop

      Blink(LED0, Blue, Duration);
      Blink(LED1, Green, Duration);
      Blink(LED0, Cyan, Duration);
      Blink(LED1, Red, Duration);
      Blink(LED0, Magenta, Duration);
      Blink(LED1, Yellow, Duration);
      Blink(LED0, White, Duration);
      Blink(LED1, Blue, Duration);
      Blink(LED0, Green, Duration);
      Blink(LED1, Cyan, Duration);
      Blink(LED0, Red, Duration);
      Blink(LED1, Magenta, Duration);
      Blink(LED0, Yellow, Duration);
      Blink(LED1, White, Duration);

   end loop;

end Main;
