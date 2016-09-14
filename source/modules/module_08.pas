{ +--------------------------------------------------------------------------+ }
{ | LC-circuits v0.1.1 * LC-circuits                    [ CheapApps series ] | }
{ | Copyright (C) 2011 Pozsar Zsolt <pozsarzs@gmail.com>                     | }
{ | module_08.pas                                                            | }
{ | Module                                                                   | }
{ +--------------------------------------------------------------------------+ }
{ ************  This file is not public, contents trade secret! ************** }

unit module_08;
{$MODE OBJFPC}{$H+}
interface
var
  ValueDataIn: array[0..7] of real;
  ValueDataOut: array[0..7] of real;
  NameDataIn: array[0..7] of string;
  NameDataOut: array[0..7] of string;
  NameModule: string;

Resourcestring
  MESSAGE01='Two way crossover filter #6';
  MESSAGE02='f|kHz|crossover frequency';
  MESSAGE03='Z|Ω|impedance';
  MESSAGE04='C1|µF|capacitor';
  MESSAGE05='C1|µF|capacitor';
  MESSAGE06='C2|µF|capacitor';
  MESSAGE07='C3|µF|capacitor';
  MESSAGE08='L1|µH|inductor';
  MESSAGE09='L2|µH|inductor';
  MESSAGE10='L3|µH|inductor';

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
  z, f, c1, c2, c3, l1, l2, l3: real;
begin
  try
    z:=ValueDataIn[1];
    f:=ValueDataIn[0]*1000;

    c1:=1/(2*pi*f*z);
    c2:=1/(4*pi*f*z);
    c3:=1.6/(2*pi*f*z);
    l1:=z/(2*pi*f);
    l2:=(2*z)/(2*pi*f);
    l3:=(1/1.6)*(z/(2*pi*f));

    ValueDataOut[0]:=c1*1000000;
    ValueDataOut[1]:=c2*1000000;
    ValueDataOut[2]:=c3*1000000;
    ValueDataOut[3]:=l1*1000000;
    ValueDataOut[4]:=l2*1000000;
    ValueDataOut[5]:=l3*1000000;
  except
    ValueDataOut[0]:=0;
    ValueDataOut[1]:=0;
    ValueDataOut[2]:=0;
    ValueDataOut[3]:=0;
    ValueDataOut[4]:=0;
    ValueDataOut[5]:=0;
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
  NameDataOut[1]:=MESSAGE06;
  NameDataOut[2]:=MESSAGE07;
  NameDataOut[3]:=MESSAGE08;
  NameDataOut[4]:=MESSAGE09;
  NameDataOut[5]:=MESSAGE10;
end.
