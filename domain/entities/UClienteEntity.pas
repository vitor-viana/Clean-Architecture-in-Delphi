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

    procedure SetNome(const ANome: String);
    procedure SetEmail(const AEmail: string);
    procedure SetTelefone(const ATelefone: string);

  public
    constructor Create(const ANome: string; const AEmail: string; const ATelefone: string);reintroduce;
    property Nome: string read FNome write SetNome;
    function GetEmail: string;
    function GetTelefone: string;
  end;

implementation
   
{ TCliente }

constructor TCliente.Create(const ANome: string; const AEmail: string; const ATelefone: string);
begin
  Nome := ANome;
  SetEmail(AEmail);
  SetTelefone(ATelefone);
    
end;

 procedure Tcliente.SetNome(const ANome: String);
 begin
  if ANome = '' then
    raise Exception.Create('Nome não pode ser vazio.');
  FNome := ANome;
 end;

procedure TCliente.SetEmail(const AEmail: string);
begin
  if not AEmail.Contains('@') then
    raise Exception.Create('E-mail inválido informado no construtor.');
  
  FEmail := AEmail;
  
end;

function TCliente.GetEmail: string;
begin
  Result := FEmail;
end;

procedure TCliente.SetTelefone(const ATelefone: string);
begin
  if Length(ATelefone) < 10 then
    raise Exception.Create('Telefone inválido informado no construtor.');
  
  FTelefone := ATelefone;
  
end;

function TCliente.GetTelefone: string;
begin
  Result := FTelefone;
end;

end.
