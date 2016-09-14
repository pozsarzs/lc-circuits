{ +--------------------------------------------------------------------------+ }
{ | LC-circuits v0.1.1 * LC-circuits                    [ CheapApps series ] | }
{ | Copyright (C) 2011 Pozsar Zsolt <pozsarzs@gmail.com>                     | }
{ | modules.pas                                                              | }
{ | Module collector (static version for fp units)                           | }
{ +--------------------------------------------------------------------------+ }
{ ************  This file is not public, contents trade secret! ************** }

unit modules;
{$MODE OBJFPC}{$H+}
interface
uses
  module_01, module_02, module_03, module_04, module_05,
  module_06, module_07, module_08, module_09, module_10,
  module_11, module_12, module_13, module_14, module_15,
  module_16, module_17, module_18, module_19, module_20,
  module_21, module_22, module_23, module_24, module_25,
  module_26;
var
  NameDataIn: array[0..63,0..7] of string;
  NameDataOut: array[0..63,0..7] of string;
  NameModule: array[0..63] of string;

procedure CollectNames;
procedure SetInputData(modnum: byte; num: byte; value: real);
function Calculate(modnum: byte): boolean;
function GetOutputData(modnum: byte; num: byte): real;

implementation

procedure CollectNames;
var
 b: byte;
begin
  for b:=0 to 7 do
  begin
    NameDataIn[0,b]:=Module_01.GetNameDataIn(b);
    NameDataIn[1,b]:=Module_02.GetNameDataIn(b);
    NameDataIn[2,b]:=Module_03.GetNameDataIn(b);
    NameDataIn[3,b]:=Module_04.GetNameDataIn(b);
    NameDataIn[4,b]:=Module_05.GetNameDataIn(b);
    NameDataIn[5,b]:=Module_06.GetNameDataIn(b);
    NameDataIn[6,b]:=Module_07.GetNameDataIn(b);
    NameDataIn[7,b]:=Module_08.GetNameDataIn(b);
    NameDataIn[8,b]:=Module_09.GetNameDataIn(b);
    NameDataIn[9,b]:=Module_10.GetNameDataIn(b);
    NameDataIn[10,b]:=Module_11.GetNameDataIn(b);
    NameDataIn[11,b]:=Module_12.GetNameDataIn(b);
    NameDataIn[12,b]:=Module_13.GetNameDataIn(b);
    NameDataIn[13,b]:=Module_14.GetNameDataIn(b);
    NameDataIn[14,b]:=Module_15.GetNameDataIn(b);
    NameDataIn[15,b]:=Module_16.GetNameDataIn(b);
    NameDataIn[16,b]:=Module_17.GetNameDataIn(b);
    NameDataIn[17,b]:=Module_18.GetNameDataIn(b);
    NameDataIn[18,b]:=Module_19.GetNameDataIn(b);
    NameDataIn[19,b]:=Module_20.GetNameDataIn(b);
    NameDataIn[20,b]:=Module_21.GetNameDataIn(b);
    NameDataIn[21,b]:=Module_22.GetNameDataIn(b);
    NameDataIn[22,b]:=Module_23.GetNameDataIn(b);
    NameDataIn[23,b]:=Module_24.GetNameDataIn(b);
    NameDataIn[24,b]:=Module_25.GetNameDataIn(b);
    NameDataIn[25,b]:=Module_26.GetNameDataIn(b);
    NameDataOut[0,b]:=Module_01.GetNameDataOut(b);
    NameDataOut[1,b]:=Module_02.GetNameDataOut(b);
    NameDataOut[2,b]:=Module_03.GetNameDataOut(b);
    NameDataOut[3,b]:=Module_04.GetNameDataOut(b);
    NameDataOut[4,b]:=Module_05.GetNameDataOut(b);
    NameDataOut[5,b]:=Module_06.GetNameDataOut(b);
    NameDataOut[6,b]:=Module_07.GetNameDataOut(b);
    NameDataOut[7,b]:=Module_08.GetNameDataOut(b);
    NameDataOut[8,b]:=Module_09.GetNameDataOut(b);
    NameDataOut[9,b]:=Module_10.GetNameDataOut(b);
    NameDataOut[10,b]:=Module_11.GetNameDataOut(b);
    NameDataOut[11,b]:=Module_12.GetNameDataOut(b);
    NameDataOut[12,b]:=Module_13.GetNameDataOut(b);
    NameDataOut[13,b]:=Module_14.GetNameDataOut(b);
    NameDataOut[14,b]:=Module_15.GetNameDataOut(b);
    NameDataOut[15,b]:=Module_16.GetNameDataOut(b);
    NameDataOut[16,b]:=Module_17.GetNameDataOut(b);
    NameDataOut[17,b]:=Module_18.GetNameDataOut(b);
    NameDataOut[18,b]:=Module_19.GetNameDataOut(b);
    NameDataOut[19,b]:=Module_20.GetNameDataOut(b);
    NameDataOut[20,b]:=Module_21.GetNameDataOut(b);
    NameDataOut[21,b]:=Module_22.GetNameDataOut(b);
    NameDataOut[22,b]:=Module_23.GetNameDataOut(b);
    NameDataOut[23,b]:=Module_24.GetNameDataOut(b);
    NameDataOut[24,b]:=Module_25.GetNameDataOut(b);
    NameDataOut[25,b]:=Module_26.GetNameDataOut(b);
    NameModule[0]:=Module_01.GetName;
    NameModule[1]:=Module_02.GetName;
    NameModule[2]:=Module_03.GetName;
    NameModule[3]:=Module_04.GetName;
    NameModule[4]:=Module_05.GetName;
    NameModule[5]:=Module_06.GetName;
    NameModule[6]:=Module_07.GetName;
    NameModule[7]:=Module_08.GetName;
    NameModule[8]:=Module_09.GetName;
    NameModule[9]:=Module_10.GetName;
    NameModule[10]:=Module_11.GetName;
    NameModule[11]:=Module_12.GetName;
    NameModule[12]:=Module_13.GetName;
    NameModule[13]:=Module_14.GetName;
    NameModule[14]:=Module_15.GetName;
    NameModule[15]:=Module_16.GetName;
    NameModule[16]:=Module_17.GetName;
    NameModule[17]:=Module_18.GetName;
    NameModule[18]:=Module_19.GetName;
    NameModule[19]:=Module_20.GetName;
    NameModule[20]:=Module_21.GetName;
    NameModule[21]:=Module_22.GetName;
    NameModule[22]:=Module_23.GetName;
    NameModule[23]:=Module_24.GetName;
    NameModule[24]:=Module_25.GetName;
    NameModule[25]:=Module_26.GetName;
  end;
end;

procedure SetInputData(modnum: byte; num: byte; value: real);
begin
  case modnum of
     0: Module_01.SetDataIn(num, value);
     1: Module_02.SetDataIn(num, value);
     2: Module_03.SetDataIn(num, value);
     3: Module_04.SetDataIn(num, value);
     4: Module_05.SetDataIn(num, value);
     5: Module_06.SetDataIn(num, value);
     6: Module_07.SetDataIn(num, value);
     7: Module_08.SetDataIn(num, value);
     8: Module_09.SetDataIn(num, value);
     9: Module_10.SetDataIn(num, value);
    10: Module_11.SetDataIn(num, value);
    11: Module_12.SetDataIn(num, value);
    12: Module_13.SetDataIn(num, value);
    13: Module_14.SetDataIn(num, value);
    14: Module_15.SetDataIn(num, value);
    15: Module_16.SetDataIn(num, value);
    16: Module_17.SetDataIn(num, value);
    17: Module_18.SetDataIn(num, value);
    18: Module_19.SetDataIn(num, value);
    19: Module_20.SetDataIn(num, value);
    20: Module_21.SetDataIn(num, value);
    21: Module_22.SetDataIn(num, value);
    22: Module_23.SetDataIn(num, value);
    23: Module_24.SetDataIn(num, value);
    24: Module_25.SetDataIn(num, value);
    25: Module_26.SetDataIn(num, value);
  end;
end;

function Calculate(modnum: byte): boolean;
begin
  case modnum of
     0: Result:=Module_01.Calculate;
     1: Result:=Module_02.Calculate;
     2: Result:=Module_03.Calculate;
     3: Result:=Module_04.Calculate;
     4: Result:=Module_05.Calculate;
     5: Result:=Module_06.Calculate;
     6: Result:=Module_07.Calculate;
     7: Result:=Module_08.Calculate;
     8: Result:=Module_09.Calculate;
     9: Result:=Module_10.Calculate;
    10: Result:=Module_11.Calculate;
    11: Result:=Module_12.Calculate;
    12: Result:=Module_13.Calculate;
    13: Result:=Module_14.Calculate;
    14: Result:=Module_15.Calculate;
    15: Result:=Module_16.Calculate;
    16: Result:=Module_17.Calculate;
    17: Result:=Module_18.Calculate;
    18: Result:=Module_19.Calculate;
    19: Result:=Module_20.Calculate;
    20: Result:=Module_21.Calculate;
    21: Result:=Module_22.Calculate;
    22: Result:=Module_23.Calculate;
    23: Result:=Module_24.Calculate;
    24: Result:=Module_25.Calculate;
    25: Result:=Module_26.Calculate;
  end;
end;

function GetOutputData(modnum: byte; num: byte): real;
begin
  case modnum of
     0: Result:=Module_01.GetDataOut(num);
     1: Result:=Module_02.GetDataOut(num);
     2: Result:=Module_03.GetDataOut(num);
     3: Result:=Module_04.GetDataOut(num);
     4: Result:=Module_05.GetDataOut(num);
     5: Result:=Module_06.GetDataOut(num);
     6: Result:=Module_07.GetDataOut(num);
     7: Result:=Module_08.GetDataOut(num);
     8: Result:=Module_09.GetDataOut(num);
     9: Result:=Module_10.GetDataOut(num);
    10: Result:=Module_11.GetDataOut(num);
    11: Result:=Module_12.GetDataOut(num);
    12: Result:=Module_13.GetDataOut(num);
    13: Result:=Module_14.GetDataOut(num);
    14: Result:=Module_15.GetDataOut(num);
    15: Result:=Module_16.GetDataOut(num);
    16: Result:=Module_17.GetDataOut(num);
    17: Result:=Module_18.GetDataOut(num);
    18: Result:=Module_19.GetDataOut(num);
    19: Result:=Module_20.GetDataOut(num);
    20: Result:=Module_21.GetDataOut(num);
    21: Result:=Module_22.GetDataOut(num);
    22: Result:=Module_23.GetDataOut(num);
    23: Result:=Module_24.GetDataOut(num);
    24: Result:=Module_25.GetDataOut(num);
    25: Result:=Module_26.GetDataOut(num);
  end;
end;

end.

