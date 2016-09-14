{ +--------------------------------------------------------------------------+ }
{ | LC-circuits v0.1.1 * LC-circuits                    [ CheapApps series ] | }
{ | Copyright (C) 2011 Pozsar Zsolt <pozsarzs@gmail.com>                     | }
{ | module_20.pas                                                            | }
{ | Module                                                                   | }
{ +--------------------------------------------------------------------------+ }
{ ************  This file is not public, contents trade secret! ************** }

unit module_20;
{$MODE OBJFPC}{$H+}
interface
var
  ValueDataIn: array[0..7] of real;
  ValueDataOut: array[0..7] of real;
  NameDataIn: array[0..7] of string;
  NameDataOut: array[0..7] of string;
  NameModule: string;

Resourcestring
  MESSAGE01='Asymmetric band pass T-section filter';
  MESSAGE02='fmin|kHz|lower cutoff frequency';
  MESSAGE03='fmax|kHz|upper cutoff frequency';
  MESSAGE04='Z|Ω|impedance';
  MESSAGE05='C1|nF|capacitor';
  MESSAGE06='C2|nF|capacitor';
  MESSAGE07='L1|µH|inductor';
  MESSAGE08='L2|µH|inductor';

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
    c2:=2/(z*(cf2-cf1));
	l1:=z/(cf2-cf1);
	l2:=((z*(cf2-cf1))/(cfm*cfm))/2;

    ValueDataOut[0]:=c1*1000000000;
    ValueDataOut[1]:=c2*1000000000;
    ValueDataOut[2]:=l1*1000000;
    ValueDataOut[3]:=l2*1000000;
  except
    ValueDataOut[0]:=0;
    ValueDataOut[1]:=0;
    ValueDataOut[2]:=0;
    ValueDataOut[3]:=0;
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
  NameDataOut[2]:=MESSAGE07;
  NameDataOut[3]:=MESSAGE08;
end.
