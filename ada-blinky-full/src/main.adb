with System;
with Tasking; use Tasking;

procedure Main is
   pragma Priority (System.Priority'First);
begin
   Wait_Forever;
end Main;
