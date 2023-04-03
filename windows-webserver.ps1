# define variables
$version = 'nginx-1.22.1.zip'
$uri = 'http://nginx.org/download/' + $version                                               
$path = 'C:\'
$myname = $env:COMPUTERNAME

# Install Nginx
Start-BitsTransfer -Source $uri -Destination $path
Expand-Archive -Path Join-Path($path, $version) -DestinationPath $path

# Set the home page. 
echo 'My name is $myname' | Set-Content -Path 'C:\nginx-1.22.1\html\index.html'

# echo '<html><body><h2>Welcome to Azure! My name is $myname .</h2></body></html>' | Set-Content -Path 'C:\1\nginx-1.22.1\html\index.html'

# $content = Get-Content -Path 'C:\nginx-1.22.1\html\index.html'
# $newContent = $content -replace 'nginx', $env:computername
# $newContent | Set-Content -Path 'C:\nginx-1.22.1\html\index.html'
