#--------------------------------------------
# Declare Global Variables and Functions here
#--------------------------------------------

# Variáveis globais
$mfaCode = ''
$usuarioAutenticado = ''

[System.Windows.Forms.Screen]::AllScreens[0].bounds.width - ($f.bounds.Width + 1)

#Configurações de acesso ao banco de dados
Add-Type -Path "C:\Program Files (x86)\MySQL\MySQL Connector NET 8.3.0\MySql.Data.dll"
#$parametros = "server=127.0.0.1;port=3306;user=root;password=Datadmin0!;database=stock_genius" #Banco Local
$parametros = "server=51.195.139.221;port=3306;user=zenthons;password=Datadmin0!;database=stock_genius" #Banco Remoto
$connection = New-Object MySql.Data.MySqlClient.MySqlConnection
$connection.ConnectionString = $parametros

#Sample function that provides the location of the script
function Get-ScriptDirectory
{
<#
	.SYNOPSIS
		Get-ScriptDirectory returns the proper location of the script.

	.OUTPUTS
		System.String
	
	.NOTES
		Returns the correct path within a packaged executable.
#>
	[OutputType([string])]
	param ()
	if ($null -ne $hostinvocation)
	{
		Split-Path $hostinvocation.MyCommand.path
	}
	else
	{
		Split-Path $script:MyInvocation.MyCommand.Path
	}
}

# Configuração do e-mail
$emailRemetente = "stockgenius.pucpr@gmail.com"
$emailDestinatario = ""
$smtpHost = "smtp.gmail.com"
$porta = 587 # Usando TLS
$usuarioSmtp = $emailRemetente # E-mail de acesso ao SMTP
$senhaSmtp = "lmmi xyrk jqnv nyiq" # Chave de acesso ao SMTP
$assunto = ""

#Função para enviar e-mail
function Enviar-Email
{
	param (
		[string]$CorpoTexto,
		[string]$Assunto,
		[string]$EmailRemetente,
		[string]$EmailDestinatario,
		[string]$SmtpHost,
		[int]$Porta,
		[string]$UsuarioSmtp,
		[string]$SenhaSmtp
	)
	
	$SecurePassword = ConvertTo-SecureString $SenhaSmtp -AsPlainText -Force
	$credenciais = New-Object System.Management.Automation.PSCredential ($UsuarioSmtp, $SecurePassword)
	
	Send-MailMessage -From $EmailRemetente `
					 -To $EmailDestinatario `
					 -Subject $Assunto `
					 -Body $CorpoTexto `
					 -SmtpServer $SmtpHost `
					 -Port $Porta `
					 -Credential $credenciais `
					 -UseSsl `
					 -BodyAsHtml # Garante que o corpo do e-mail seja tratado como HTML
	
	if ($?)
	{
		Write-Host "E-mail enviado com sucesso!"
	}
	else
	{
		Write-Host "Erro ao enviar e-mail!"
	}
}

function Hash-Senha
{
	param (
		[string]$password
	)
	
	# Cria uma instância SHA256
	$sha256 = [System.Security.Cryptography.SHA256]::Create()
	
	# Converte a senha para um array de bytes
	$passwordBytes = [System.Text.Encoding]::UTF8.GetBytes($password)
	
	# Computa o hash da senha
	$hashBytes = $sha256.ComputeHash($passwordBytes)
	
	# Converte o hash de volta para uma string (em hexadecimal)
	$hashString = [BitConverter]::ToString($hashBytes) -replace '-'
	
	return $hashString
}

# Definir a expressão regular para validar e-mails
$emailPattern = '^\S+@\S+\.\S+$'

# Função para validar o e-mail
function Validar-Email
{
	param (
		[string]$email
	)
	
	return [System.Text.RegularExpressions.Regex]::IsMatch($email, $emailPattern)
}

function Validar-Senha
{
	param (
		[string]$password
	)
	
	# Verifica o comprimento da senha
	$minLength = $password.Length -ge 8
	
	# Verifica a presença de uma letra maiúscula
	$upperCase = $password -match '[A-Z]'
	
	# Verifica a presença de um número
	$number = $password -match '\d'
	
	# Verifica a presença de um caractere especial
	$specialChar = $password -match '\W'
	
	# Retorna $true se todos os critérios forem atendidos
	return $minLength -and $upperCase -and $number -and $specialChar
}

# Gera uma senha aleatória que contém pelo menos uma letra maiúscula, um número e um caractere especial.
# Uso: $variavel = gerarSenha n (n é o tamanho da senha)
function gerarSenha
{
	param (
		[Parameter(Mandatory)]
		[int]$length
	)
	
	# Define os caracteres a serem utilizados
	$upperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.ToCharArray()
	$numbers = '0123456789'.ToCharArray()
	$specialChars = '!@#$%&*'.ToCharArray()
	$lowerCase = 'abcdefghijklmnopqrstuvwxyz'.ToCharArray()
	
	# Combina todos os conjuntos de caracteres
	$charSet = $upperCase + $numbers + $specialChars + $lowerCase
	
	$rng = New-Object System.Security.Cryptography.RNGCryptoServiceProvider
	$bytes = New-Object byte[]($length)
	
	$rng.GetBytes($bytes)
	
	$result = New-Object char[]($length)
	
	# Garante pelo menos um caractere de cada tipo necessário
	$result[0] = $upperCase[$bytes[0] % $upperCase.Length]
	$result[1] = $numbers[$bytes[1] % $numbers.Length]
	$result[2] = $specialChars[$bytes[2] % $specialChars.Length]
	
	# Preenche o restante da senha com caracteres aleatórios de todos os tipos
	for ($i = 3; $i -lt $length; $i++)
	{
		$result[$i] = $charSet[$bytes[$i] % $charSet.Length]
	}
	
	# Embaralha a senha para que os caracteres obrigatórios não estejam sempre nas primeiras posições
	$result = $result | Get-Random -Count $length
	
	return (-join $result)
}

#Pega o diretório da pasta do programa
$diretorioRaiz = Get-ScriptDirectory

#Sample variable that provides the location of the script
[string]$ScriptDirectory = Get-ScriptDirectory



