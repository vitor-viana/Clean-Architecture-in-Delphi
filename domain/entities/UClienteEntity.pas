unit UClienteEntity;

interface

uses
  System.SysUtils; 

type
  TCliente = class
  private
    FNome: string;
    FEmail: string;
    FTelefone: string;
  public
    constructor Create(const ANome: string; const AEmail: string; const ATelefone: string);reintroduce;
    property Nome: string read FNome write FNome;
    function SetEmail(const AEmail: string): boolean;
    function GetEmail: string;
    function SetTelefone(const ATelefone: string): boolean;
    function GetTelefone: string;
  end;

implementation
   
{ TCliente }

constructor TCliente.Create(const ANome: string; const AEmail: string; const ATelefone: string);
begin
  if ANome = '' then
    raise Exception.Create('Nome não pode ser vazio.');
  Nome := ANome;
  
  if not SetEmail(AEmail) then
    raise Exception.Create('E-mail inválido informado no construtor.');
  
  if not SetTelefone(ATelefone) then
    raise Exception.Create('Telefone inválido informado no construtor.');
end;

function TCliente.SetEmail(const AEmail: string): boolean;
begin
  if not AEmail.Contains('@') then
  begin
    Result := False;
    Exit;
  end;
  FEmail := AEmail;
  Result := True;
end;

function TCliente.GetEmail: string;
begin
  Result := FEmail;
end;

function TCliente.SetTelefone(const ATelefone: string): boolean;
begin
  if Length(ATelefone) < 10 then
  begin
    Result := False;
    Exit;
  end;
  FTelefone := ATelefone;
  Result := True;
end;

function TCliente.GetTelefone: string;
begin
  Result := FTelefone;
end;

end.
