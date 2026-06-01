unit UClienteRepositoryTests;

interface

uses
  DUnitX.TestFramework,
  UClienteRepository,
  UClienteEntity,
  System.SysUtils;

type
  [TestFixture]
  TClienteRepositoryTests = class
  public
    [Test]
    procedure SetAndGetCliente_ReturnsStoredCliente;
  end;

implementation

procedure TClienteRepositoryTests.SetAndGetCliente_ReturnsStoredCliente;
var
  Repo: TClienteRepository;
  C, R: TCliente;
begin
  Repo := TClienteRepository.Create;
  try
    C := TCliente.Create('Beltrano', 'beltrano@example.com', '11999998888');
    try
      Repo.SetCliente(C);
    finally
      C.Free;
    end;

    R := Repo.GetCliente('11999998888');
    Assert.IsNotNull(R);
    Assert.AreEqual('Beltrano', R.Nome);
    Assert.AreEqual('beltrano@example.com', R.GetEmail);
    Assert.AreEqual('11999998888', R.GetTelefone);
  finally
    Repo.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TClienteRepositoryTests);

end.
