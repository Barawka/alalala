unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAGraph, TASeries, Forms, Controls, Graphics,
  Dialogs, StdCtrls, crt,Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Label1: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  x,e,a,b,c:real;
  n:integer;

implementation

{$R *.lfm}

{ TForm1 }
function f(x:real):real;
  begin
    f:=Power(3,x)-9*sqr(x)+5*x-6;
  end;

procedure TForm1.Button1Click(Sender: TObject);
 var sms:string;
     code1,code2,code3:integer;
     k:real;
begin
  sms:=InputBox('Введите а','Ввод а','');
  val(sms,a,code1);
  if code1<>0 then
   begin
   showmessage('Неправильно ввели а');
   exit;
   end;

   sms:=InputBox('Введите b','Ввод b','');
   val(sms,b,code2);
   if code2<>0 then
    begin
     showmessage('Неправильно ввели b');
     exit;
    end;

    sms:=InputBox('Введите e','Ввод e','');
    val(sms,e,code3);
    if code3<>0 then
     begin
      showmessage('Неправильно ввели е');
      exit;
     end;
     k:=a;
     while k<=b do
     begin
      Chart1LineSeries1.AddXY(k,f(k),'');
      k:=k+0.001;
     end;
     if f(a)*f(b)>0 then
      begin
      showmessage('Корней нету');
      memo1.Lines.add('Корней нету');
      end
     else
      begin
       repeat
        c:=a-(b-a)*f(a)/(f(b)-f(a));
        if f(a)*f(c)>0 then a:= c
        else b := c;
       until abs(f(c))<e;
       x:=c;
       memo1.lines.Add('x='+floattostr(x));
       end;
     end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.clear;
  Chart1LineSeries1.Clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  close;
end;

end.

