Class Demo.Main Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
  set hostname = $SYSTEM.INetInfo.LocalHostName()
  &html<<!DOCTYPE html>
<html>
<body>
Hello from IRIS #(hostname)#
</body>
</html>>
  Quit $$$OK
}

}
