#$url = 'https://dl.bintray.com/mitchellh/packer/packer_0.9.0_windows_386.zip'
$url = 'https://ci.appveyor.com/api/buildjobs/m1b10t5f4owlicn5/artifacts/pkg/windows_386/packer.exe'
$checksum = 'a16a29b7c08f23b761cb026204c8063bee8c8fe0'
$checksumType = 'sha1'
#$url64bit = 'https://dl.bintray.com/mitchellh/packer/packer_0.9.0_windows_amd64.zip'
$url64bit = 'https://ci.appveyor.com/api/buildjobs/on5cuiw8spjh2gx6/artifacts/pkg/windows_amd64/packer.exe'
$checksum64 = '2034ec8058175e47be9b8e709e03b088a9a7f6a7'
$checksumType64 = $checksumType
$legacyLocation = "$env:SystemDrive\HashiCorp\packer"
$unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# just to prepare the 0.9.0 package we use the AppVeyor artifcacts which are exe and not zip
$file = "$($unzipLocation)\packer.exe"
if (![System.IO.Directory]::Exists($unzipLocation)) {[System.IO.Directory]::CreateDirectory($unzipLocation)}
Get-ChocolateyWebFile $packageName $file $url $url64bit $checksum $checksum64 $checksumType $checksumType64

#Install-ChocolateyZipPackage "packer" "$url" "$unzipLocation" "$url64bit" `
# -checksum $checksum -checksumType 'sha1' -checksum64 $checksum64

If (Test-Path $legacyLocation) {
  Write-Host "Removing old packer installation from $legacyLocation"
  Remove-Item $legacyLocation -Force -Recurse
}
