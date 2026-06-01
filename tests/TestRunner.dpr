program TestRunner;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  DUnitX.TestFramework,
  DUnitX.Loggers.Console,
  UClienteEntityTests,
  UClienteRepositoryTests;

var
  Runner: ITestRunner;
  Logger: ITestLogger;
  Results: IRunResults;

begin
  ReportMemoryLeaksOnShutdown := True;
  try
    Runner := TDUnitX.CreateRunner;
    Runner.UseRTTI := True;
    Logger := TDUnitXConsoleLogger.Create(True);
    Runner.AddLogger(Logger);

    Results := Runner.Execute;
    if not Results.AllPassed then
      System.ExitCode := 1;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Writeln;
  Writeln('Pressione Enter para fechar...');
  Readln;
end.
