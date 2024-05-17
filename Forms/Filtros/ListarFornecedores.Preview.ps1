#----------------------------------------------
# Generated Form Function
#----------------------------------------------
function Show-ListarFornecedores_psf {

	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$form1 = New-Object 'System.Windows.Forms.Form'
	$buttonEditarFornecedor = New-Object 'System.Windows.Forms.Button'
	$labelLogout = New-Object 'System.Windows.Forms.Label'
	$labelLogadoComousuario = New-Object 'System.Windows.Forms.Label'
	$buttonDeletarFornecedor = New-Object 'System.Windows.Forms.Button'
	$buttonListarFornecedores = New-Object 'System.Windows.Forms.Button'
	$listaFornecedores = New-Object 'System.Windows.Forms.ListView'
	$listarFornecedoresLabel = New-Object 'System.Windows.Forms.Label'
	$picturebox1 = New-Object 'System.Windows.Forms.PictureBox'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$form1.SuspendLayout()
	$picturebox1.BeginInit()
	#
	# form1
	#
	$form1.Controls.Add($buttonEditarFornecedor)
	$form1.Controls.Add($labelLogout)
	$form1.Controls.Add($labelLogadoComousuario)
	$form1.Controls.Add($buttonDeletarFornecedor)
	$form1.Controls.Add($buttonListarFornecedores)
	$form1.Controls.Add($listaFornecedores)
	$form1.Controls.Add($listarFornecedoresLabel)
	$form1.Controls.Add($picturebox1)
	$form1.AutoScaleDimensions = New-Object System.Drawing.SizeF(6, 13)
	$form1.AutoScaleMode = 'Font'
	$form1.ClientSize = New-Object System.Drawing.Size(734, 617)
	$form1.Name = 'form1'
	$form1.Text = 'Form'
	$form1.add_Load($form1_Load)
	#
	# buttonEditarFornecedor
	#
	$buttonEditarFornecedor.BackColor = [System.Drawing.Color]::Gold 
	$buttonEditarFornecedor.Enabled = $False
	$buttonEditarFornecedor.Font = [System.Drawing.Font]::new('Microsoft Sans Serif', '12')
	$buttonEditarFornecedor.Location = New-Object System.Drawing.Point(300, 538)
	$buttonEditarFornecedor.Name = 'buttonEditarFornecedor'
	$buttonEditarFornecedor.Size = New-Object System.Drawing.Size(124, 48)
	$buttonEditarFornecedor.TabIndex = 24
	$buttonEditarFornecedor.Text = 'Editar Fornecedor'
	$buttonEditarFornecedor.UseVisualStyleBackColor = $False
	#
	# labelLogout
	#
	$labelLogout.AutoSize = $True
	$labelLogout.Cursor = 'Hand'
	$labelLogout.Font = [System.Drawing.Font]::new('Microsoft Sans Serif', '12', [System.Drawing.FontStyle]'Bold')
	$labelLogout.ForeColor = [System.Drawing.Color]::FromArgb(255, 192, 0, 0)
	$labelLogout.Location = New-Object System.Drawing.Point(657, 9)
	$labelLogout.Name = 'labelLogout'
	$labelLogout.Size = New-Object System.Drawing.Size(65, 20)
	$labelLogout.TabIndex = 23
	$labelLogout.Text = 'Logout'
	#
	# labelLogadoComousuario
	#
	$labelLogadoComousuario.AutoSize = $True
	$labelLogadoComousuario.Font = [System.Drawing.Font]::new('Microsoft Sans Serif', '12')
	$labelLogadoComousuario.Location = New-Object System.Drawing.Point(12, 9)
	$labelLogadoComousuario.Name = 'labelLogadoComousuario'
	$labelLogadoComousuario.Size = New-Object System.Drawing.Size(171, 20)
	$labelLogadoComousuario.TabIndex = 22
	$labelLogadoComousuario.Text = "Logado como $usuario"
	#
	# buttonDeletarFornecedor
	#
	$buttonDeletarFornecedor.BackColor = [System.Drawing.Color]::LightCoral 
	$buttonDeletarFornecedor.Enabled = $False
	$buttonDeletarFornecedor.Font = [System.Drawing.Font]::new('Microsoft Sans Serif', '12')
	$buttonDeletarFornecedor.Location = New-Object System.Drawing.Point(439, 538)
	$buttonDeletarFornecedor.Name = 'buttonDeletarFornecedor'
	$buttonDeletarFornecedor.Size = New-Object System.Drawing.Size(129, 48)
	$buttonDeletarFornecedor.TabIndex = 21
	$buttonDeletarFornecedor.Text = 'Deletar Fornecedor'
	$buttonDeletarFornecedor.UseVisualStyleBackColor = $False
	#
	# buttonListarFornecedores
	#
	$buttonListarFornecedores.BackColor = [System.Drawing.Color]::SpringGreen 
	$buttonListarFornecedores.Font = [System.Drawing.Font]::new('Microsoft Sans Serif', '12')
	$buttonListarFornecedores.Location = New-Object System.Drawing.Point(161, 538)
	$buttonListarFornecedores.Name = 'buttonListarFornecedores'
	$buttonListarFornecedores.Size = New-Object System.Drawing.Size(124, 48)
	$buttonListarFornecedores.TabIndex = 20
	$buttonListarFornecedores.Text = 'Listar Fornecedores'
	$buttonListarFornecedores.UseVisualStyleBackColor = $False
	#
	# listaFornecedores
	#
	$listaFornecedores.FullRowSelect = $True
	$listaFornecedores.GridLines = $True
	$listaFornecedores.HideSelection = $False
	$listaFornecedores.Location = New-Object System.Drawing.Point(72, 285)
	$listaFornecedores.Name = 'listaFornecedores'
	$listaFornecedores.Size = New-Object System.Drawing.Size(585, 229)
	$listaFornecedores.TabIndex = 19
	$listaFornecedores.UseCompatibleStateImageBehavior = $False
	$listaFornecedores.View = 'Details'
	#
	# listarFornecedoresLabel
	#
	$listarFornecedoresLabel.AutoSize = $True
	$listarFornecedoresLabel.Font = [System.Drawing.Font]::new('Microsoft Sans Serif', '16.2')
	$listarFornecedoresLabel.Location = New-Object System.Drawing.Point(288, 238)
	$listarFornecedoresLabel.Name = 'listarFornecedoresLabel'
	$listarFornecedoresLabel.Size = New-Object System.Drawing.Size(158, 26)
	$listarFornecedoresLabel.TabIndex = 18
	$listarFornecedoresLabel.Text = 'Listar Produtos'
	#
	# picturebox1
	#
	#region Binary Data
	$Formatter_binaryFomatter = New-Object System.Runtime.Serialization.Formatters.Binary.BinaryFormatter
	$System_IO_MemoryStream = New-Object System.IO.MemoryStream (,[byte[]][System.Convert]::FromBase64String('
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'))
	#endregion
	$picturebox1.Image = $Formatter_binaryFomatter.Deserialize($System_IO_MemoryStream)
	$Formatter_binaryFomatter = $null
	$System_IO_MemoryStream = $null
	$picturebox1.Location = New-Object System.Drawing.Point(289, 56)
	$picturebox1.Name = 'picturebox1'
	$picturebox1.Size = New-Object System.Drawing.Size(156, 169)
	$picturebox1.SizeMode = 'Zoom'
	$picturebox1.TabIndex = 17
	$picturebox1.TabStop = $False
	$picturebox1.EndInit()
	$form1.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $form1.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$form1.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$form1.add_FormClosed($Form_Cleanup_FormClosed)
	#Show the Form
	return $form1.ShowDialog()

} #End Function

#Call the form
Show-ListarFornecedores_psf | Out-Null
