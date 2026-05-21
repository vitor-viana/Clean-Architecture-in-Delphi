program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UClienteEntity in 'domain\entities\UClienteEntity.pas',
  UClienteInterface in 'domain\interfaces\UClienteInterface.pas',
  UClienteUseCases in 'application\useCases\UClienteUseCases.pas',
  UClienteRepository in 'infrastructure\repository\UClienteRepository.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    Writeln('ola');
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
