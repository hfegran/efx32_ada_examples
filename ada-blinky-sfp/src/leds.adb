with Leds; use Leds;
with Interfaces.EFM32; use Interfaces.EFM32;
with Ada.Real_Time; use Ada.Real_Time;


package body Leds is

   procedure Led_Init is
   begin
      CMU_Periph.CTRL.HFPERCLKEN  := 1;
      CMU_Periph.HFBUSCLKEN0.GPIO := 1;
   
      GPIO_Periph.PA_MODEH.Arr(12) := PUSHPULL;
      GPIO_Periph.PA_MODEH.Arr(13) := PUSHPULL;
      GPIO_Periph.PA_MODEH.Arr(14) := PUSHPULL;

      GPIO_Periph.PD_MODEL.Arr(6)  := PUSHPULL;
      GPIO_Periph.PF_MODEH.Arr(12) := PUSHPULL;
      GPIO_Periph.PE_MODEH.Arr(12) := PUSHPULL;
        
      Led_Set(LED0, Blue);
      Led_Set(LED1, Green);
      
   end Led_Init;

   procedure Blink(LED: Led_No; Led_Color : Color; Duration : Time_Span) is
      Timeout : Time := Clock;
   begin
      Led_Set(LED, Led_Color);
      Timeout := Timeout + Duration/2;
      delay until Timeout;
      Timeout := Timeout + Duration/2;
      delay until Timeout;
   end Blink;

   procedure GPIO_Set_Pin(Port : Port_Type; Pin : Pin_Type) is
   begin
      case Port is
         when PA =>
            GPIO_Periph.PA_DOUT.DOUT := GPIO_Periph.PA_DOUT.DOUT or
                                        Shift_Left(16#0001#, Pin_Type'Pos(Pin));
         when PB =>
            GPIO_Periph.PB_DOUT.DOUT := GPIO_Periph.PB_DOUT.DOUT or
                                        Shift_Left(16#0001#, Pin_Type'Pos(Pin));
         when PC =>
            GPIO_Periph.PC_DOUT.DOUT := GPIO_Periph.PC_DOUT.DOUT or
                                        Shift_Left(16#0001#, Pin_Type'Pos(Pin));
         when PD =>
            GPIO_Periph.PD_DOUT.DOUT := GPIO_Periph.PD_DOUT.DOUT or
                                        Shift_Left(16#0001#, Pin_Type'Pos(Pin));
         when PE =>
            GPIO_Periph.PE_DOUT.DOUT := GPIO_Periph.PE_DOUT.DOUT or
                                        Shift_Left(16#0001#, Pin_Type'Pos(Pin));
         when PF =>
            GPIO_Periph.PF_DOUT.DOUT := GPIO_Periph.PF_DOUT.DOUT or
                                        Shift_Left(16#0001#, Pin_Type'Pos(Pin));
      end case;
   end GPIO_Set_Pin;

   procedure GPIO_Clr_Pin(Port : Port_Type; Pin : Pin_Type) is
   begin
      case Port is
         when PA =>
            GPIO_Periph.PA_DOUT.DOUT := GPIO_Periph.PA_DOUT.DOUT and
                                        not Shift_Left(16#0001#, Pin_Type'Pos(Pin));
         when PB =>
            GPIO_Periph.PB_DOUT.DOUT := GPIO_Periph.PB_DOUT.DOUT and
                                        not Shift_Left(16#0001#, Pin_Type'Pos(Pin));
         when PC =>
            GPIO_Periph.PC_DOUT.DOUT := GPIO_Periph.PC_DOUT.DOUT and
                                        not Shift_Left(16#0001#, Pin_Type'Pos(Pin));
         when PD =>
            GPIO_Periph.PD_DOUT.DOUT := GPIO_Periph.PD_DOUT.DOUT and
                                        not Shift_Left(16#0001#, Pin_Type'Pos(Pin));
         when PE =>
            GPIO_Periph.PE_DOUT.DOUT := GPIO_Periph.PE_DOUT.DOUT and
                                        not Shift_Left(16#0001#, Pin_Type'Pos(Pin));
         when PF =>
            GPIO_Periph.PF_DOUT.DOUT := GPIO_Periph.PF_DOUT.DOUT and
                                        not Shift_Left(16#0001#, Pin_Type'Pos(Pin));
      end case;
   end GPIO_Clr_Pin;

   Procedure GPIO_Tgl_Pin(Port : Port_Type; Pin : Pin_Type) is
   begin
      case Port is
         when PA =>
            GPIO_Periph.PA_DOUTTGL.DOUTTGL := Shift_Left(16#0001#, Pin_Type'Pos(Pin));
         when PB =>
            GPIO_Periph.PB_DOUTTGL.DOUTTGL := Shift_Left(16#0001#, Pin_Type'Pos(Pin));
         when PC =>
            GPIO_Periph.PC_DOUTTGL.DOUTTGL := Shift_Left(16#0001#, Pin_Type'Pos(Pin));
         when PD =>
            GPIO_Periph.PD_DOUTTGL.DOUTTGL := Shift_Left(16#0001#, Pin_Type'Pos(Pin));
         when PE =>
            GPIO_Periph.PE_DOUTTGL.DOUTTGL := Shift_Left(16#0001#, Pin_Type'Pos(Pin));
         when PF =>
            GPIO_Periph.PF_DOUTTGL.DOUTTGL := Shift_Left(16#0001#, Pin_Type'Pos(Pin));
      end case;
   end GPIO_Tgl_Pin;

   procedure Led_Set (LED : Led_No; Led_Color : Color) is
   begin
      case Led_Color is
         when Blue => 
            case LED is
               when LED0 => 
                  GPIO_Set_Pin(PA, P12);
                  GPIO_Set_Pin(PA, P14);
                  GPIO_Clr_Pin(PA, P13);
               when LED1 =>
                  GPIO_Set_Pin(PD, P6);
                  GPIO_Set_Pin(PF, P12);
                  GPIO_Clr_Pin(PE, P12);

            end case;

         when Green =>
            case LED is
               when LED0 =>
                  GPIO_Set_Pin(PA, P12);
                  GPIO_Clr_Pin(PA, P14);
                  GPIO_Set_Pin(PA, P13);
               when LED1 =>
                  GPIO_Set_Pin(PD, P6);
                  GPIO_Clr_Pin(PF, P12);
                  GPIO_Set_Pin(PE, P12);
            end case;

         when Cyan =>
            case LED is
               when LED0 =>
                  GPIO_Set_Pin(PA, P12);
                  GPIO_Clr_Pin(PA, P14);
                  GPIO_Clr_Pin(PA, P13);
               when LED1 =>
                  GPIO_Set_Pin(PD, P6);
                  GPIO_Clr_Pin(PF, P12);
                  GPIO_Clr_Pin(PE, P12);
            end case;

         when Red =>
            case LED is
               when LED0 =>
                  GPIO_Clr_Pin(PA, P12);
                  GPIO_Set_Pin(PA, P14);
                  GPIO_Set_Pin(PA, P13);
               when LED1 =>
                  GPIO_Clr_Pin(PD, P6);
                  GPIO_Set_Pin(PF, P12);
                  GPIO_Set_Pin(PE, P12);
            end case;

         when Magenta =>
            case LED is
               when LED0 =>
                  GPIO_Clr_Pin(PA, P12);
                  GPIO_Set_Pin(PA, P14);
                  GPIO_Clr_Pin(PA, P13);
               when LED1 =>
                  GPIO_Clr_Pin(PD, P6);
                  GPIO_Set_Pin(PF, P12);
                  GPIO_Clr_Pin(PE, P12);
            end case;

         when Yellow =>
            case LED is
               when LED0 =>
                  GPIO_Clr_Pin(PA, P12);
                  GPIO_Clr_Pin(PA, P14);
                  GPIO_Set_Pin(PA, P13);
               when LED1 =>
                  GPIO_Clr_Pin(PD, P6);
                  GPIO_Clr_Pin(PF, P12);
                  GPIO_Set_Pin(PE, P12);
            end case;

         when White =>
            case LED is
               when LED0 =>
                  GPIO_Clr_Pin(PA, P12);
                  GPIO_Clr_Pin(PA, P14);
                  GPIO_Clr_Pin(PA, P13);
               when LED1 =>
                  GPIO_Clr_Pin(PD, P6);
                  GPIO_Clr_Pin(PF, P12);
                  GPIO_Clr_Pin(PE, P12);
            end case;

         when Black =>
            case LED is
               when LED0 =>
                  GPIO_Set_Pin(PA, P12);
                  GPIO_Set_Pin(PA, P14);
                  GPIO_Set_Pin(PA, P13);
               when LED1 =>
                  GPIO_Set_Pin(PD, P6);
                  GPIO_Set_Pin(PF, P12);
                  GPIO_Set_Pin(PE, P12);
            end case;
      end case;
   end Led_Set;
end Leds;

