unit UClienteUseCases;

interface

uses
    UClienteInterface,
    UClienteEntity;

type
    TClienteUseCases = class
    private
        Repository: ICliente;
    public
        constructor Create(const ARepository: ICliente);
        function GetCliente(const ATelefone: string): TCliente;
        procedure SetCliente(const ACliente: TCliente);
    end;

implementation
{ TClienteUseCases }

constructor TClienteUseCases.Create(const ARepository: ICliente);
begin
    Repository := ARepository;
end;

function TClienteUseCases.GetCliente(const ATelefone: string): TCliente;
begin
    Result := Repository.GetCliente(ATelefone);
end;

procedure TClienteUseCases.SetCliente(const ACliente: TCliente);
begin
    Repository.SetCliente(ACliente);
end;

end.
