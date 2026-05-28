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
    var repository := TClienteRepository.Create;
    var useCases := TClienteUseCases.Create(repository);

    useCases.SetCliente(TCliente.Create('vitor', 'vitor.silva@email.com', '21911111111'));
    useCases.SetCliente(TCliente.Create('maria', 'maria.silva@email.com', '21922222222'));
    var c := useCases.GetCliente('21911111111');

    try
      Writeln('Cliente criado com sucesso');
      Writeln('Nome: ', c.Nome);
      Writeln('E-mail: ', c.GetEmail);
      Writeln('Telefone: ', c.GetTelefone);

    finally
      c.Free;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.
