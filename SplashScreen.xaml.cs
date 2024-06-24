using System;
using System.ComponentModel;
using System.Threading;
using System.Windows;

namespace ArchiveVSK
{
    /// <summary>
    /// Логика взаимодействия для SplashScreen.xaml
    /// </summary>
    public partial class SplashScreen : Window
    {
        public SplashScreen()
        {
            InitializeComponent();
        }
        private void Window_ContentRendered(object sender, EventArgs e)
        {
            BackgroundWorker worker = new BackgroundWorker();
            worker.WorkerReportsProgress = true;
            worker.DoWork += Worker_DoWork;
            worker.ProgressChanged += Worker_ProgressChanged;
            worker.RunWorkerAsync();
        }

        void Worker_DoWork(object sender, DoWorkEventArgs e)
        {
            for (int i = 0; i <= 70; i++)
            {
                (sender as BackgroundWorker).ReportProgress(i);
                Thread.Sleep(50);
            }
        }

        void Worker_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            ProgressBar.Value = e.ProgressPercentage;

            if (ProgressBar.Value == 70)
            {
                MainWindow mainWindow = new MainWindow();
                Close();
                mainWindow.ShowDialog();
            }
        }
    }
}
