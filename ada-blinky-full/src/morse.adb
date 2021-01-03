package body Morse is
   
   Dot_Duration  : constant Time_Span := Milliseconds(100);
   Dash_Duration : constant Time_Span := Milliseconds(200);

   procedure Blink_Morse(LED: Led_No; Led_Color : Color; Duration : Time_Span) is
      Timeout : Time := Clock;
   begin
      Led_Set(LED, Led_Color);
      Timeout := Timeout + Duration;
      delay until Timeout;
      Led_Set(LED, Black);
      Timeout := Timeout + Dot_Duration;
      delay until Timeout;
   end Blink_Morse;
      
   procedure Dot is
   begin
      Blink_Morse(LED0, Yellow, Dot_Duration);
   end Dot;

   procedure Dash is
   begin
      Blink_Morse(LED0, Blue, Dash_Duration);
   end Dash;

   procedure Morse_Display (S : String) is 
      Timeout : Time := Clock;
   begin
      for I of S loop
         case I is
            when 'a' => Dot; Dash;
            when 'b' => Dash; Dot; Dot; Dot;
            when 'c' => Dash; Dot; Dash; Dot;
            when 'd' => Dash; Dot; Dot;
            when 'e' => Dot;
            when 'f' => Dot; Dot; Dash; Dot;
            when 'g' => Dash; Dash; Dot;
            when 'h' => Dot; Dot; Dot; Dot;
            when 'i' => Dot; Dot;
            when 'j' => Dash; Dot; Dash;
            when 'k' => Dash; Dot; Dash;
            when 'l' => Dot; Dash; Dot; Dot;
            when 'm' => Dash; Dash;
            when 'n' => Dash; Dot;
            when 'o' => Dash; Dash; Dash;
            when 'p' => Dot; Dash; Dash; Dot;
            when 'q' => Dash; Dash; Dot; Dash;
            when 'r' => Dot; Dash; Dot;
            when 's' => Dot; Dot; Dot;
            when 't' => Dash;
            when 'u' => Dot; Dot; Dash;
            when 'v' => Dot; Dot; Dot; Dash;
            when 'w' => Dot; Dash; Dash;
            when 'x' => Dash; Dot; Dot; Dash;
            when 'y' => Dash; Dot; Dash; Dash;
            when 'z' => Dash; Dash; Dot; Dot;
            when 'A' => Dot; Dash;
            when 'B' => Dash; Dot; Dot; Dot;
            when 'C' => Dash; Dot; Dash; Dot;
            when 'D' => Dash; Dot; Dot;
            when 'E' => Dot;
            when 'F' => Dot; Dot; Dash; Dot;
            when 'G' => Dash; Dash; Dot;
            when 'H' => Dot; Dot; Dot; Dot;
            when 'I' => Dot; Dot;
            when 'J' => Dash; Dot; Dash;
            when 'K' => Dash; Dot; Dash;
            when 'L' => Dot; Dash; Dot; Dot;
            when 'M' => Dash; Dash;
            when 'N' => Dash; Dot;
            when 'O' => Dash; Dash; Dash;
            when 'P' => Dot; Dash; Dash; Dot;
            when 'Q' => Dash; Dash; Dot; Dash;
            when 'R' => Dot; Dash; Dot;
            when 'S' => Dot; Dot; Dot;
            when 'T' => Dash;
            when 'U' => Dot; Dot; Dash;
            when 'V' => Dot; Dot; Dot; Dash;
            when 'W' => Dot; Dash; Dash;
            when 'X' => Dash; Dot; Dot; Dash;
            when 'Y' => Dash; Dot; Dash; Dash;
            when 'Z' => Dash; Dash; Dot; Dot;
            when '1' => Dot; Dash; Dash; Dash; Dash;
            when '2' => Dot; Dot; Dash; Dash; Dash;
            when '3' => Dot; Dot; Dot; Dash; Dash;
            when '4' => Dot; Dot; Dot; Dot; Dash;
            when '5' => Dot; Dot; Dot; Dot; Dot;
            when '6' => Dash; Dot; Dot; Dot; Dot;
            when '7' => Dash; Dash; Dot; Dot; Dot;
            when '8' => Dash; Dash; Dash; Dot; Dot;
            when '9' => Dash; Dash; Dash; Dash; Dot;
            when '0' => Dash; Dash; Dash; Dash; Dash;
            when others => null;
         end case;

         Timeout := Clock;
         if I in 'a' .. 'z' or
            I in 'A' .. 'Z' or
            I in '0' .. '9' then
            delay until Timeout + 2 * Dot_Duration;
         elsif I = ' ' then
            delay until Timeout + 6 * Dot_Duration;
         end if;
      end loop;

   end Morse_Display;
end Morse;
