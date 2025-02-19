$headlinetext = 'Study for CPTS you lazy fuck'
$bodytext = "you wanna pentest don't you?"
$logo = "$($env:USERPROFILE)\Documents\Coding_Projects\Powershell\Toast\htb.jpg" #place the path to the image you want here
$image = "$($env:USERPROFILE)\Documents\Coding_Projects\Powershell\Toast\cover.png" #and here
$url = "https://academy.hackthebox.com"
$sleep_time = 10

$xml = @"
<toast>
    <visual>
        <binding template="ToastGeneric">
            <text>$($headlinetext)</text>
            <text>$($bodytext)</text>
            <image placement="appLogoOverride" hint-crop="circle" src="$($logo)"/>
            <image placement="hero" src="$($image)"/>
        </binding>
    </visual>
    <actions>
        <action arguments="$($url)" content="Go to Hack the Box Academy" activationType="protocol"/>
    </actions>
</toast>
"@

$XmlDocument = [Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime]::New()
$XmlDocument.loadXml($xml)
$AppID = '{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe'

while ($true) {
    Start-Sleep -Seconds $sleep_time
    [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime]::CreateToastNotifier($AppID).Show($XmlDocument)
    $sleep_time = $sleep_time/2
    if ($sleep_time -lt 1) {
        break
    }
}
