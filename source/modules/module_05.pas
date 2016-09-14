{ +--------------------------------------------------------------------------+ }
{ | LC-circuits v0.1.1 * LC-circuits                    [ CheapApps series ] | }
{ | Copyright (C) 2011 Pozsar Zsolt <pozsarzs@gmail.com>                     | }
{ | module_05.pas                                                            | }
{ | Module                                                                   | }
{ +--------------------------------------------------------------------------+ }
{ ************  This file is not public, contents trade secret! ************** }

unit module_05;
{$MODE OBJFPC}{$H+}
interface
var
  ValueDataIn: array[0..7] of real;
  ValueDataOut: array[0..7] of real;
  NameDataIn: array[0..7] of string;
  NameDataOut: array[0..7] of string;
  NameModule: string;

Resourcestring
  MESSAGE01='Two way crossover filter #3';
  MESSAGE02='f|kHz|crossover frequency';
  MESSAGE03='Z|Ω|impedance';
  MESSAGE04='C|µF|capacitor';
  MESSAGE05='L1|µH|inductor';
  MESSAGE06='L2|µH|inductor';

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
  z, f, c, l1, l2: real;
begin
  try
    z:=ValueDataIn[1];
    f:=ValueDataIn[0]*1000;

    c:=sqrt(2)/(2*pi*f*z);
    l1:=z/(2*pi*f);
    l2:=l1/sqrt(2);

    ValueDataOut[0]:=c*1000000;
    ValueDataOut[1]:=l1*1000000;
    ValueDataOut[2]:=l2*1000000;
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
  NameDataOut[2]:=MESSAGE06;
end.
