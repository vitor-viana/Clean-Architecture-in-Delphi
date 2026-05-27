unit UClienteRepository;

interface

uses
	System.SysUtils,
	System.Generics.Collections,
	UClienteEntity,
	UClienteInterface;

type
	TClienteRepository = class(TInterfacedObject, ICliente)
	private
		FClientes: TObjectList<TCliente>;
		function FindClienteByTelefone(const ATelefone: string): TCliente;
	public
		constructor Create;
		destructor Destroy; override;
		function GetCliente(const ATelefone: string): TCliente;
		procedure SetCliente(const ACliente: TCliente);
	end;

implementation

{ TClienteRepository }

constructor TClienteRepository.Create;
begin
	inherited Create;
	FClientes := TObjectList<TCliente>.Create(True);
end;

destructor TClienteRepository.Destroy;
begin
	FClientes.Free;
	inherited;
end;

function TClienteRepository.FindClienteByTelefone(const ATelefone: string): TCliente;
var
	Cliente: TCliente;
begin
	Result := nil;

	for Cliente in FClientes do
	begin
		if SameText(Cliente.GetTelefone, ATelefone) then
		begin
			Result := Cliente;
			Exit;
		end;
	end;
end;

function TClienteRepository.GetCliente(const ATelefone: string): TCliente;
begin
	Result := FindClienteByTelefone(ATelefone);
end;

procedure TClienteRepository.SetCliente(const ACliente: TCliente);
var
	ClienteExistente: TCliente;
begin
	if Assigned(ACliente) then
	begin
		ClienteExistente := FindClienteByTelefone(ACliente.GetTelefone);
		if Assigned(ClienteExistente) then
		begin
			FClientes.Remove(ClienteExistente);
		end;

		FClientes.Add(TCliente.Create(ACliente.Nome, ACliente.GetEmail, ACliente.GetTelefone));
	end;
end;

end.
