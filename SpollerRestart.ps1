[console]::BackgroundColor = "Black"
cls
Write-Host `n "Перезапуск спулера сервера" `n -Backgroundcolor DarkGreen
$server = Read-Host "Введите имя Сервера для перезапуска спулера"
Write-Host `n "Проверяем состояние сервиса печати" `n
Get-Service spooler, cpsvc -computername $server | format-table -property Name, Status, DisplayName
Write-Host `n "Останавливаем сервисы" `n
Get-Service spooler, cpsvc -computername $server | stop-service -force
Write-Host `n "Ожидаем 5 секунд " `n 
Start-Sleep -s 5
Write-Host `n "Проверяем состояние сервиса печати" `n
Get-Service spooler, cpsvc -computername $server | format-table -property Name, Status, DisplayName
Write-Host `n "Запускаем серисы" `n 
Get-Service cpsvc -computername $server | start-service
Write-Host `n "Проверяем состояние сервиса печати" `n
Get-Service spooler, cpsvc -computername $server | format-table -property Name, Status, DisplayName
Read-Host "Сервис перезапущен, нажмите любую кнопку"