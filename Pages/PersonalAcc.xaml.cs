using ArchiveVSK.Classes;
using System.Windows;
using System.Windows.Controls;

namespace ArchiveVSK.Pages
{
    /// <summary>
    /// Логика взаимодействия для PersonalAcc.xaml
    /// </summary>
    public partial class PersonalAcc : Page
    {
        public PersonalAcc()
        {
            InitializeComponent();
        }

        private void ExtAcc_Click(object sender, RoutedEventArgs e)
        {
            ClassFrame.frmObj.Navigate(new Authorization());
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            ClassFrame.frmObj.GoBack();
        }
    }
}
