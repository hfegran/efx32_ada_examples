with Leds; use Leds;
with Ada.Real_Time; use Ada.Real_Time;

package Morse is 
   procedure Blink_Morse(LED: Led_No; Led_Color : Color; Duration : Time_Span);
   procedure Dot;
   procedure Dash;
   procedure Morse_Display (S : String);
end Morse;
