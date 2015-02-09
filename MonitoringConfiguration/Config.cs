using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MonitoringConfiguration
{
    public partial class Config : Form
    {
        public Config()
        {
            InitializeComponent();
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            List<MonitoredServer> monitoredServers = GetMonitoredServers(txtConnectionString.Text);
            FillListView(monitoredServers);
        }

        private void FillListView(List<MonitoredServer> monitoredServers)
        {

            lvServers.Columns.Add("Server Name");
            lvServers.Columns.Add("Server Id");
            foreach(MonitoredServer monitoredServer in monitoredServers)
            {
                //ListViewItem listItem = new ListViewItem(monitoredServer.Id.ToString());
                ListViewItem listItem = new ListViewItem(monitoredServer.ServerName) { Tag = monitoredServer };
                listItem.SubItems.Add(monitoredServer.Id.ToString());
                lvServers.Items.Add(listItem);
            }
        }
        public class MonitoredServer 
        {
            public string ServerName;
            public int Id;
        };

        static List<MonitoredServer> GetMonitoredServers(string connectionString)
        {
            List<MonitoredServer> MonitoredServers = new List<MonitoredServer>();
            
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("SELECT * FROM dbo.MonitoredServer", connection))
                {
                    connection.Open();

                    SqlDataReader reader = command.ExecuteReader();
                    try
                    {
                        while (reader.Read())
                        {
                            MonitoredServers.Add(new MonitoredServer
                            {
                                ServerName = reader["ServerName"].ToString()
                                ,
                                Id = Int32.Parse(reader["ServerId"].ToString())
                            });
                        }
                    }
                    finally
                    {
                        reader.Close();
                    }
                }
            }

            return MonitoredServers;
        }
    }
}
