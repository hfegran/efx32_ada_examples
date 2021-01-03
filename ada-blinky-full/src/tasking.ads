with System;

package Tasking is
   procedure Wait_Forever;

   task Init is
      pragma Priority(System.Priority'Last - 2);
   end Init;

   task Task_1 is
      pragma Priority(System.Priority'Last - 1);
   end Task_1;
   
   task Task_2 is
      pragma Priority(System.Priority'Last);
   end Task_2;

   procedure Last_Chance_Handler (Msg : System.Address; Line : Integer);
   pragma Export (C, Last_Chance_Handler, "__gnat_last_chance_handler");
end Tasking;

