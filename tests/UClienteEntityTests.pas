unit UClienteEntityTests;

interface

uses
  DUnitX.TestFramework,
  UClienteEntity,
  System.SysUtils;

type
  [TestFixture]
  TClienteEntityTests = class
  public
    [Test]
    procedure Create_ValidValues_AssignsFields;

    [Test]
    procedure Create_EmptyName_RaisesException;

    [Test]
    procedure Create_InvalidEmail_RaisesException;

    [Test]
    procedure Create_InvalidPhone_RaisesException;
  end;

implementation

procedure TClienteEntityTests.Create_ValidValues_AssignsFields;
var
  C: TCliente;
begin
  C := TCliente.Create('Fulano', 'fulano@example.com', '11987654321');
  try
    Assert.AreEqual('Fulano', C.Nome);
    Assert.AreEqual('fulano@example.com', C.GetEmail);
    Assert.AreEqual('11987654321', C.GetTelefone);
  finally
    C.Free;
  end;
end;

procedure TClienteEntityTests.Create_EmptyName_RaisesException;
begin
  Assert.WillRaise(
    procedure
    var C: TCliente;
    begin
      C := TCliente.Create('', 'a@b.com', '11987654321');
      C.Free;
    end,
    Exception
  );
end;

procedure TClienteEntityTests.Create_InvalidEmail_RaisesException;
begin
  Assert.WillRaise(
    procedure
    var C: TCliente;
    begin
      C := TCliente.Create('Fulano', 'invalid-email', '11987654321');
      C.Free;
    end,
    Exception
  );
end;

procedure TClienteEntityTests.Create_InvalidPhone_RaisesException;
begin
  Assert.WillRaise(
    procedure
    var C: TCliente;
    begin
      C := TCliente.Create('Fulano', 'fulano@example.com', '123');
      C.Free;
    end,
    Exception
  );
end;

initialization
  TDUnitX.RegisterTestFixture(TClienteEntityTests);

end.
