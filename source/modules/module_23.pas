{ +--------------------------------------------------------------------------+ }
{ | LC-circuits v0.4.1 * LC-circuits                                         | }
{ | Copyright (C) 2011-2016 Pozsar Zsolt <pozsarzs@gmail.com>                | }
{ | module_23.pas                                                            | }
{ | Module (static, fp unit - v0.3+)                                         | }
{ +--------------------------------------------------------------------------+ }

{
  Copyright (C) 2011-2016 Pozsar Zsolt

  This program is free software: you can redistribute it and/or modify
it under the terms of the European Union Public License version 1.1.

  This program is distributed WITHOUT ANY WARRANTY; without even the implied
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
}

unit module_23;
{$MODE OBJFPC}{$H+}
interface
var
  NameModule: string;                                          // Name of module
  ValueActiveElements: array[0..15] of real;    // Parameters of active elements
  ValueDataIn: array[0..15] of real;                           // Initial values
  ValueDataOut: array[0..15] of real;                           // Result values
  NameActiveElements: array[0..15] of string;           // Description of values
  NameDataIn: array[0..15] of string;                   // Description of values
  NameDataOut: array[0..15] of string;                  // Description of values
  ErrorCode: byte;                                          // Actual error code
  ErrorMessages: array[0..15] of string;                       // Error messages
  HowToSetLinkActive: boolean;            //Enable/disable "How to set it?" link
const
  MODULE_ID='lc23';                                                 // Module ID

Resourcestring
  MESSAGE01='Asymmetric band stop L-section filter';
  MESSAGE02='fmin|kHz|lower cutoff frequency';
  MESSAGE03='fmax|kHz|upper cutoff frequency';
  MESSAGE04='Z|Ω|impedance';
  MESSAGE05='C1|nF|capacitor';
  MESSAGE06='C2|nF|capacitor';
  MESSAGE07='L1|µH|inductor';
  MESSAGE08='L2|µH|inductor';
  MESSAGE09='Calculation error, please check values!';

function GetName: string;
function GetID: string;
procedure SetActiveElements(num: byte; value: real);
procedure SetDataIn(num: byte; value: real);
function GetDataOut(num: byte): real;
function GetNameActiveElements(num: byte): string;
function GetNameDataIn(num: byte): string;
function GetNameDataOut(num: byte): string;
function GetErrorMessage(num: byte): string;
function GetErrorCode: byte;
function GetHowToSetLinkActive: boolean;
function Calculate: byte;

implementation

// Calculation
function Calculate: byte;var
  z, f1, f2, fm, cf1, cf2, cfm, c1, c2, l1, l2: real;
begin
  try
    z:=ValueDataIn[2];
    f1:=ValueDataIn[0]*1000;
    f2:=ValueDataIn[1]*1000;

    if f2<f1 then
	begin
	  fm:=f2;
	  f2:=f1;
	  f1:=fm;
	 end;

    fm:=(f1+f2)/2;
	cf1:=2*pi*f1;
	cf2:=2*pi*f2;
	cfm:=2*pi*fm;
	
	c1:=(cf2-cf1)/(cfm*cfm*z);
    c2:=1/(z*(cf2-cf1));
	l1:=z/(cf2-cf1);
	l2:=(z*(cf2-cf1))/(cfm*cfm);

    ValueDataOut[0]:=c1*1000000000;
    ValueDataOut[1]:=c2*1000000000;
    ValueDataOut[2]:=l1*1000000;
    ValueDataOut[3]:=l2*1000000;
  except
    ValueDataOut[0]:=0;
    ValueDataOut[1]:=0;
    ValueDataOut[2]:=0;
    ValueDataOut[3]:=0;
    ErrorCode:=1;
    Result:=ErrorCode;
    exit;
  end;
  ErrorCode:=0;
  Result:=ErrorCode;
end;

{$I module_commonproc.inc}

initialization
  ErrorCode:=0;
  HowToSetLinkActive:=false;
  NameModule:=MESSAGE01;
  NameDataIn[0]:=MESSAGE02;
  NameDataIn[1]:=MESSAGE03;
  NameDataIn[2]:=MESSAGE04;
  NameDataOut[0]:=MESSAGE05;
  NameDataOut[1]:=MESSAGE06;
  NameDataOut[2]:=MESSAGE07;
  NameDataOut[3]:=MESSAGE08;
  ErrorMessages[0]:=MESSAGE09;
end.
