with Interfaces; use Interfaces;
with Interfaces.EFM32.CMU; use Interfaces.EFM32.CMU;
with Interfaces.EFM32.GPIO; use Interfaces.EFM32.GPIO;

package Leds is
   type Bit is mod 2**1
     with Size => 1;

   type Color is (Blue, Green, Cyan, Red, Magenta, Yellow, White, Black);

   type Pin_Type is (P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15);
   type Led_No is (LED0, LED1);

   type Port_Type is (PA, PB, PC, PD, PE, PF);

   procedure Led_Init;
   procedure Led_Set (LED : Led_No; Led_Color : Color);
   procedure Blink(LED: Led_No; Led_Color : Color);
   procedure GPIO_Tgl_Pin(Port : Port_Type; Pin : Pin_Type);
   procedure GPIO_Set_Pin(Port : Port_Type; Pin : Pin_Type);
   procedure GPIO_Clr_Pin(Port : Port_Type; Pin : Pin_Type);

end Leds;
