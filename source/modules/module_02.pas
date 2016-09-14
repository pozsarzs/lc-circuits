{ +--------------------------------------------------------------------------+ }
{ | LC-circuits v0.1.1 * LC-circuits                    [ CheapApps series ] | }
{ | Copyright (C) 2011 Pozsar Zsolt <pozsarzs@gmail.com>                     | }
{ | module_02.pas                                                            | }
{ | Module                                                                   | }
{ +--------------------------------------------------------------------------+ }
{ ************  This file is not public, contents trade secret! ************** }

unit module_02;
{$MODE OBJFPC}{$H+}
interface
var
  ValueDataIn: array[0..7] of real;
  ValueDataOut: array[0..7] of real;
  NameDataIn: array[0..7] of string;
  NameDataOut: array[0..7] of string;
  NameModule: string;

Resourcestring
  MESSAGE01='Seefried impedance transformer';
  MESSAGE02='Z1|Ω|input impedance';
  MESSAGE03='Z2|Ω|output impedance';
  MESSAGE04='f|MHz|frequency';
  MESSAGE05='C|pF|capacitor';
  MESSAGE06='L|µH|inductors';
  
function Calculate: boolean;
function GetName: string;
function GetNameDataIn(num: byte): string;
function GetNameDataOut(num: byte): string;
function GetDataOut(num: byte): real;
procedure SetDataIn(num: byte; value: real);

Implementation

// 'main' function
function Calculate: boolean;
var
  z1, z2, ztr, f, c, l: real;
begin
  try
    z1:=ValueDataIn[0];
    z2:=ValueDataIn[1];
    f:=ValueDataIn[2];
    
    ztr:=sqrt(z1*z2);
    l:=ztr/(2*pi*f);
    c:=1000000/(2*pi*f*ztr);
	
    ValueDataOut[0]:=c;
    ValueDataOut[1]:=l;
  except
    ValueDataOut[0]:=0;
    ValueDataOut[1]:=0;
    calculate:=false;
    exit;
  end;
  calculate:=true;
end;

{$I module_commonproc.inc}

initialization
  NameModule:=MESSAGE01;
  NameDataIn[0]:=MESSAGE02;
  NameDataIn[1]:=MESSAGE03;
  NameDataIn[2]:=MESSAGE04;
  NameDataOut[0]:=MESSAGE05;
  NameDataOut[1]:=MESSAGE06;
end.
