# define variables
$version = 'nginx-1.22.1.zip'
$uri = 'http://nginx.org/download/' + $version                                               
$path = 'C:\'
$downloadpath = join-path -path $path -childpath $version
$myname = $env:COMPUTERNAME

# Install Nginx
Start-BitsTransfer -Source $uri -Destination $path
Expand-Archive -Path $downloadpath -DestinationPath $path
Remove-Item 'C:\nginx-1.22.1.zip' -Recurse

# Set the home page. 
echo "<html><body><h2>Welcome to Azure! My name is $myname.</h2></body></html>" | Set-Content -Path "C:\nginx-1.22.1\html\index.html"

# $content = Get-Content -Path 'C:\nginx-1.22.1\html\index.html'
# $newContent = $content -replace 'nginx', $env:computername
# $newContent | Set-Content -Path 'C:\nginx-1.22.1\html\index.html'

# Run Nginx
cd 'C:\nginx-1.22.1'
Start nginx

# Set OS Firewall to allow port 80
New-NetFirewallRule -DisplayName "Allow Port 80" -Direction Inbound -LocalPort 80 -Protocol TCP -Action Allow
