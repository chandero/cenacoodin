/*
 * Creado por SharpDevelop.
 * Usuario: acruz
 * Fecha: 2007/11/19
 * Hora: 09:17 a.m.
 * 
 * Para cambiar esta plantilla use Herramientas | Opciones | Codificación | Editar Encabezados Estándar
 */

using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.IO;

namespace UDPClient
{
	/// <summary>
	/// Description of MainForm.
	/// </summary>
	public partial class MainForm : Form
	{
		public MainForm()
		{
			//
			// The InitializeComponent() call is required for Windows Forms designer support.
			//
			InitializeComponent();
			
			//
			// TODO: Add constructor code after the InitializeComponent() call.
			//
		}
		
		void BtnBuscarClick(object sender, EventArgs e)
		{
			if (openFileDialog1.ShowDialog() == DialogResult.OK)
			{
				edFileName.Text = openFileDialog1.FileName;
			}
		}
		
		void Button1Click(object sender, EventArgs e)
		{
			byte[] data = new byte[1024];
			IPEndPoint ip = new IPEndPoint(IPAddress.Parse(edIP.Text.ToString()), Convert.ToInt32(edPort.Text.ToString()));

			Socket server = new Socket(AddressFamily.InterNetwork,SocketType.Dgram, ProtocolType.Udp);

			FileStream file = new FileStream(openFileDialog1.FileName, FileMode.Open,FileAccess.Read);
			Encoding en = Encoding.GetEncoding("ISO-8859-1");
			BinaryReader br = new BinaryReader(file);

			data = br.ReadBytes(data.Length);
			server.SendTo(data, data.Length, SocketFlags.None, ip);
/*
			IPEndPoint _sender = new IPEndPoint(IPAddress.Any, 0);
			EndPoint Remote = (EndPoint)_sender;

			data = new byte[1024];
			int receivedDataLength = server.ReceiveFrom(data, ref Remote);
*/
			server.Close();
			file.Close();
			file.Dispose();
			
		}
	}
}
