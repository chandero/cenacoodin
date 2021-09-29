/*
 * Creado por SharpDevelop.
 * Usuario: acruz
 * Fecha: 2007/11/19
 * Hora: 09:17 a.m.
 * 
 * Para cambiar esta plantilla use Herramientas | Opciones | Codificación | Editar Encabezados Estándar
 */
namespace UDPClient
{
	partial class MainForm
	{
		/// <summary>
		/// Designer variable used to keep track of non-visual components.
		/// </summary>
		private System.ComponentModel.IContainer components = null;
		
		/// <summary>
		/// Disposes resources used by the form.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing) {
				if (components != null) {
					components.Dispose();
				}
			}
			base.Dispose(disposing);
		}
		
		/// <summary>
		/// This method is required for Windows Forms designer support.
		/// Do not change the method contents inside the source code editor. The Forms designer might
		/// not be able to load this method if it was changed manually.
		/// </summary>
		private void InitializeComponent()
		{
			this.btnBuscar = new System.Windows.Forms.Button();
			this.label1 = new System.Windows.Forms.Label();
			this.edFileName = new System.Windows.Forms.TextBox();
			this.label2 = new System.Windows.Forms.Label();
			this.edIP = new System.Windows.Forms.TextBox();
			this.label3 = new System.Windows.Forms.Label();
			this.edPort = new System.Windows.Forms.TextBox();
			this.button1 = new System.Windows.Forms.Button();
			this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
			this.SuspendLayout();
			// 
			// btnBuscar
			// 
			this.btnBuscar.Location = new System.Drawing.Point(248, 7);
			this.btnBuscar.Name = "btnBuscar";
			this.btnBuscar.Size = new System.Drawing.Size(23, 23);
			this.btnBuscar.TabIndex = 13;
			this.btnBuscar.Text = "...";
			this.btnBuscar.UseVisualStyleBackColor = true;
			this.btnBuscar.Click += new System.EventHandler(this.BtnBuscarClick);
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(3, 9);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(52, 23);
			this.label1.TabIndex = 12;
			this.label1.Text = "Archivo:";
			// 
			// edFileName
			// 
			this.edFileName.Location = new System.Drawing.Point(61, 9);
			this.edFileName.Name = "edFileName";
			this.edFileName.Size = new System.Drawing.Size(183, 20);
			this.edFileName.TabIndex = 11;
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(3, 35);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(52, 17);
			this.label2.TabIndex = 14;
			this.label2.Text = "Host:";
			// 
			// edIP
			// 
			this.edIP.Location = new System.Drawing.Point(61, 32);
			this.edIP.Name = "edIP";
			this.edIP.Size = new System.Drawing.Size(122, 20);
			this.edIP.TabIndex = 15;
			this.edIP.Text = "192.168.200.250";
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(3, 58);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(52, 16);
			this.label3.TabIndex = 16;
			this.label3.Text = "Port:";
			// 
			// edPort
			// 
			this.edPort.Location = new System.Drawing.Point(61, 58);
			this.edPort.Name = "edPort";
			this.edPort.Size = new System.Drawing.Size(46, 20);
			this.edPort.TabIndex = 17;
			this.edPort.Text = "3060";
			// 
			// button1
			// 
			this.button1.Location = new System.Drawing.Point(196, 58);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(75, 23);
			this.button1.TabIndex = 18;
			this.button1.Text = "&Enviar";
			this.button1.UseVisualStyleBackColor = true;
			this.button1.Click += new System.EventHandler(this.Button1Click);
			// 
			// openFileDialog1
			// 
			this.openFileDialog1.FileName = "openFileDialog1";
			// 
			// MainForm
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(292, 119);
			this.Controls.Add(this.button1);
			this.Controls.Add(this.edPort);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.edIP);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.btnBuscar);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.edFileName);
			this.Name = "MainForm";
			this.Text = "UDPClient";
			this.ResumeLayout(false);
			this.PerformLayout();
		}
		private System.Windows.Forms.TextBox edIP;
		private System.Windows.Forms.TextBox edPort;
		private System.Windows.Forms.OpenFileDialog openFileDialog1;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.TextBox edFileName;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Button btnBuscar;
	}
}
