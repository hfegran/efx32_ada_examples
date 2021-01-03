with Leds; use Leds;
with Morse; use Morse;
with Ada.Real_Time; use Ada.Real_time;

package body Tasking is
   procedure Last_Chance_Handler (Msg : System.Address; Line : Integer) is
   begin
      Led_Set(LED0, Red);
      Led_Set(LED1, Red);
   end Last_Chance_Handler;

   procedure Wait_Forever is
   begin
      loop
         delay until Clock + Seconds (3600);
      end loop;
   end Wait_Forever;
 
   task body Init is
   begin
      Led_Init;
      Wait_Forever;
   end Init;

   task body Task_1 is
     Wait_Restart : constant Time_Span := Seconds(1);
     Morse_String : constant String    := "Hello World";
     Timeout      : Time               := Clock;
   begin
      Timeout := Timeout + Wait_restart;
      delay until Timeout;

      loop
         Morse_Display (Morse_String);
         Timeout := Timeout + Wait_restart;
         delay until Timeout;
      end loop;
   exception
      when others => Led_Set(LED0, Red);
   end Task_1;

   task body Task_2 is
   begin
      loop
         Blink(LED1, Magenta, Seconds(1));
      end loop;
   exception
      when others => Led_Set(LED1, Red);
   end Task_2;
end Tasking;
