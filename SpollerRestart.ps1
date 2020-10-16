# Очищаем консоль перед использованием
Clear-Host
# легкая раскраска консоли
[console]::BackgroundColor = "Black"
# Выводим сообщение пользователю 
Write-Host `n "Перезапуск спулера сервера" `n -Backgroundcolor DarkGreen
# Запрашиваем Имя сервера для перезапуска службы
$server = Read-Host "Введите имя Сервера для перезапуска спулера"
# Выводим сообщение пользователю 
Write-Host `n "Проверяем состояние сервиса печати" `n
# Проверяем состояние сервиса
Get-Service spooler, cpsvc -computername $server | format-table -property Name, Status, DisplayName
Write-Host `n "Останавливаем сервисы" `n
# Останвливаем сервисы
Get-Service spooler, cpsvc -computername $server | stop-service -force
Write-Host `n "Ожидаем 5 секунд " `n 
# Ожидаем 5 секунд
Start-Sleep -s 5
# Проверяем состояние сервиса
Write-Host `n "Проверяем состояние сервиса печати" `n
Get-Service spooler, cpsvc -computername $server | format-table -property Name, Status, DisplayName
Write-Host `n "Запускаем серисы" `n 
# Запускаем сервисы
Get-Service cpsvc -computername $server | start-service
Write-Host `n "Проверяем состояние сервиса печати" `n
# Проверяем состояние сервиса
Get-Service spooler, cpsvc -computername $server | format-table -property Name, Status, DisplayName
# Прощаемся с пользоввателем
Read-Host "Сервис перезапущен, нажмите любую кнопку"
