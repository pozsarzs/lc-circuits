{ +--------------------------------------------------------------------------+ }
{ | LC-circuits v0.1.1 * LC-circuits                    [ CheapApps series ] | }
{ | Copyright (C) 2011 Pozsar Zsolt <pozsarzs@gmail.com>                     | }
{ | module_15.pas                                                            | }
{ | Module                                                                   | }
{ +--------------------------------------------------------------------------+ }
{ ************  This file is not public, contents trade secret! ************** }

unit module_15;
{$MODE OBJFPC}{$H+}
interface
var
  ValueDataIn: array[0..7] of real;
  ValueDataOut: array[0..7] of real;
  NameDataIn: array[0..7] of string;
  NameDataOut: array[0..7] of string;
  NameModule: string;

Resourcestring
  MESSAGE01='Asymmetric high pass T-section filter';
  MESSAGE02='f|kHz|cutoff frequency';
  MESSAGE03='Z|Ω|impedance';
  MESSAGE04='C|nF|capacitor';
  MESSAGE05='L|µH|inductor';

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
  z, f, c, l: real;
begin
  try
    z:=ValueDataIn[1];
    f:=ValueDataIn[0]*1000;

    c:=1/(2*pi*f*z);
    l:=(z/(2*pi*f))/2;

    ValueDataOut[0]:=c*1000000000;
    ValueDataOut[1]:=l*1000000;
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
  NameDataOut[0]:=MESSAGE04;
  NameDataOut[1]:=MESSAGE05;
end.
