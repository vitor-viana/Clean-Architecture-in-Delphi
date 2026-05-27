unit UClienteInterface;

interface

uses
  UClienteEntity;

type
  ICliente = interface
    ['{B1F5C3A2-9D4B-4E6A-8F3C-2A1B5D6E7F8A}']
    function GetCliente(const ATelefone: string): TCliente;
    procedure SetCliente(const ACliente: TCliente);
  end;

implementation

end.
