with Leds; use Leds; 

procedure Main is
begin
   Led_Init;

   loop

      Blink(LED0, Blue);
      Blink(LED1, Green);
      Blink(LED0, Cyan);
      Blink(LED1, Red);
      Blink(LED0, Magenta);
      Blink(LED1, Yellow);
      Blink(LED0, White);
      Blink(LED1, Blue);
      Blink(LED0, Green);
      Blink(LED1, Cyan);
      Blink(LED0, Red);
      Blink(LED1, Magenta);
      Blink(LED0, Yellow);
      Blink(LED1, White);

   end loop;

end Main;
