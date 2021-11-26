
# Load path
$File = Get-ChildItem -Path "D:\Projects\SolanaArtDistrict\iCloudPhotos2\json" 
# Get number of files in directory
$count = $file.Count
# how many copies of $FILE do you want
$howmany =111
# Starting copied file name
$n = 1
# Starting NFT or Item ID
$y = 2


for ($x = 0; $x -lt $count; $x++) 
{
    $ext = $file[$x].Extension

    for ($i = $n; $i -lt $howmany; $i++) {
        
        Copy-Item $File[$x].FullName -destination "D:\Projects\SolanaArtDistrict\iCloudPhotos2\json\$i$ext"

        $contents = Get-Content -Path "D:\Projects\SolanaArtDistrict\iCloudPhotos2\json\$i$ext" -Raw

        if ($contents -match "0.png") {
            Write-Output "Y =" +$y
            Set-Content -Value ($contents -replace "0.png", "$i.png" -replace "#1", "#$y")  -Path "D:\Projects\SolanaArtDistrict\iCloudPhotos2\json\$i$ext"
            $y++
        }
    }

}