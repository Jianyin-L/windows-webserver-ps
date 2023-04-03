# define variables
$version = 'nginx-1.22.1.zip'
$uri = 'http://nginx.org/download/' + $version                                               
$path = 'C:\'
$downloadpath = join-path -path $path -childpath $version
$myname = $env:COMPUTERNAME

# Install Nginx
Start-BitsTransfer -Source $uri -Destination $path
Expand-Archive -Path $downloadpath -DestinationPath $path

# Set the home page. 
echo "<html><body><h2>Welcome to Azure! My name is $myname .</h2></body></html>" | Set-Content -Path "C:\1\nginx-1.22.1\html\index.html"

# echo '<html><body><h2>Welcome to Azure! My name is $myname .</h2></body></html>' | Set-Content -Path 'C:\1\nginx-1.22.1\html\index.html'

# $content = Get-Content -Path 'C:\nginx-1.22.1\html\index.html'
# $newContent = $content -replace 'nginx', $env:computername
# $newContent | Set-Content -Path 'C:\nginx-1.22.1\html\index.html'

# Run Nginx
cd ../../nginx-1.22.1
start nginx
