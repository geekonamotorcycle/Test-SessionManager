# Joshua Porrata 07/01/2022
# Created to determine if there are any indicators of compromise on a system and return an MD5 if one is found
# this should be run as an administrator and is based off of information from this site https://securelist.com/the-sessionmanager-iis-backdoor/106868/

$pathstocheck = @("C:\Program Files\Microsoft\Exchange Server\V15\ClientAccess\OWA\Auth\SessionManagerModule.dll","C:\Program Files\Microsoft\Exchange Server\V15\FrontEnd\HttpProxy\bin\SessionManagerModule.dll","%WINDIR%\System32\inetsrv\SessionManagerModule.dll","%WINDIR%\System32\inetsrv\SessionManager.dll","C:\Windows\Temp\ExchangeSetup\Exch.ps1","C:\Windows\Temp\Exch.exe","C:\Windows\Temp\vmmsi.exe","C:\Windows\Temp\safenet.exe","C:\Windows\Temp\upgrade.exe","C:\Windows\Temp\exupgrade.exe","C:\Windows\Temp\dvvm.exe","C:\Windows\Temp\vgauth.exe","C:\Windows\Temp\win32.exe","C:\Users\GodLike\Desktop\t\t4\StripHeaders-master\x64\Release\sessionmanagermodule.pdb","C:\Users\GodLike\Desktop\t\t4\SessionManagerModule\x64\Release\sessionmanagermodule.pdb","C:\Users\GodLike\Desktop\t\t4\SessionManagerV2Module\x64\Release\sessionmanagermodule.pdb","C:\Users\GodLike\Desktop\t\t4\SessionManagerV3Module\x64\Release\sessionmanagermodule.pdb","C:\Users\GodLike\Desktop\t\t0\Hook-PasswordChangeNotify-master\HookPasswordChange\x64\Release\HookPasswordChange.pdb");
#$pathstocheck = @("C:\Users\JoshuaPorrata\Downloads\Windows10Upgrade9252.exe","C:\Users\JoshuaPorrata\Downloads\SPO_4.5.12.120_1033.cab","C:\Users\JoshuaPorrata\Downloads\DNE.EXE");

foreach ($path in $pathstocheck) {
    $exists = Test-Path -Path $path;
    if ($exists) {
        Write-Host -ForegroundColor Red "the file " $path "was found";
        $md5 = Get-FileHash -Path $path -Algorithm md5;
        Write-Host "The MD5 is " $md5.Hash.ToString();
    }   else {
        Write-Host -ForegroundColor Green "the file " $path "was not found";
    }
}