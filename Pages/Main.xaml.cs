using ArchiveVSK.Classes;
using ClosedXML.Excel;
using System;
using System.Diagnostics;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Navigation;

namespace ArchiveVSK.Pages
{
    /// <summary>
    /// Логика взаимодействия для Main.xaml
    /// </summary>
    public partial class Main : Page
    {
        public ICommand EditPolicyCommand { get; }
        private string currentFilter;
        public Main()
        {
            InitializeComponent();
            EditPolicyCommand = new RelayCommand<Policies>(EditPolicy);
            DataContext = this;
            DtgVSK.ItemsSource = ArchiveVSKEntities.GetContext().Policies.ToList();
            currentFilter = string.Empty;
            CheckUserRole();
        }

        public void CheckUserRole()
        {
            if(ClassFrame.RoleID == 2)
            {
                Statistika.Visibility = Visibility.Visible;
            }
            else
            {
                Statistika.Visibility= Visibility.Collapsed;
            }
        }

        private void EditPolicy(Policies selectedPolicy)
        {
            if (selectedPolicy != null)
            {
                NavigationService.Navigate(new SelectedPolicy(this, selectedPolicy));
            }
        }

        private void PersonalAcc_Click(object sender, RoutedEventArgs e)
        {
            ClassFrame.frmObj.Navigate(new PersonalAcc());   
        }

        private void ExtAcc_Click(object sender, RoutedEventArgs e)
        {
            ClassFrame.frmObj.Navigate(new Authorization());
        }

        private void Search_TextChanged(object sender, TextChangedEventArgs e)
        {
            string search = Search.Text;
            DtgVSK.ItemsSource = ArchiveVSKEntities.GetContext().Policies.
                Where(x => x.Clients.LastName.Contains(search)).ToList();
        }
        public void UpdateDtg()
        {
            DtgVSK.ItemsSource = ArchiveVSKEntities.GetContext().Policies.ToList();
        }

        private void AddPolicy_Click(object sender, RoutedEventArgs e)
        {
            ClassFrame.frmObj.Navigate(new SelectedPolicy(this, null));
        }

        private void DelPol_Click(object sender, RoutedEventArgs e)
        {
            var selectedPolicies = DtgVSK.SelectedItems.Cast<Policies>().ToList();

            if (selectedPolicies.Count == 0)
            {
                MessageBox.Show("Выберите хотя бы один полис для удаления.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (MessageBox.Show($"Удалить {selectedPolicies.Count} полис(ов)?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    var context = ArchiveVSKEntities.GetContext();
                    context.Policies.RemoveRange(selectedPolicies);
                    context.SaveChanges();

                    MessageBox.Show("Данные успешно удалены");
                    DtgVSK.ItemsSource = context.Policies.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка при удалении данных: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void Static_Click(object sender, RoutedEventArgs e)
        {
            var context = ArchiveVSKEntities.GetContext();

            int totalPolicies = context.Policies.Count();
            int osagoCount = context.Policies.Count(p => p.InsuranceTypes.TypeName == "ОСАГО");
            int kaskoCount = context.Policies.Count(p => p.InsuranceTypes.TypeName == "КАСКО");
            decimal totalCost = context.Policies.Sum(p => p.CostPolicy);
            int totalClients = context.Clients.Count();

            using (var workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("Statistics");

                worksheet.Cell(1, 1).Value = "Общее количество полисов";
                worksheet.Cell(1, 2).Value = "Количество полисов ОСАГО";
                worksheet.Cell(1, 3).Value = "Количество полисов КАСКО";
                worksheet.Cell(1, 4).Value = "Общая стоимость всех полисов";
                worksheet.Cell(1, 5).Value = "Количество клиентов";

                worksheet.Cell(2, 1).Value = totalPolicies;
                worksheet.Cell(2, 2).Value = osagoCount;
                worksheet.Cell(2, 3).Value = kaskoCount;
                worksheet.Cell(2, 4).Value = totalCost;
                worksheet.Cell(2, 5).Value = totalClients;

                string filePath = System.IO.Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Desktop), "Общая статистика.xlsx");
                workbook.SaveAs(filePath);

                Process.Start(new ProcessStartInfo(filePath) { UseShellExecute = true });

                MessageBox.Show($"Файл статистики сохранен на рабочем столе: {filePath}", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void Osago_Click(object sender, RoutedEventArgs e)
        {
            var context = ArchiveVSKEntities.GetContext();
            if(currentFilter == "ОСАГО")
            {
                DtgVSK.ItemsSource = context.Policies.ToList();
                currentFilter = string.Empty;
            }
            else
            {
                DtgVSK.ItemsSource = context.Policies.Where(p => p.InsuranceTypes.TypeName == "ОСАГО").ToList();
                currentFilter = "ОСАГО";
            }
        }

        private void Kasko_Click(object sender, RoutedEventArgs e)
        {
            var context = ArchiveVSKEntities.GetContext();
            if (currentFilter == "КАСКО")
            {
                DtgVSK.ItemsSource = context.Policies.ToList();
                currentFilter = string.Empty;
            }
            else
            {
                DtgVSK.ItemsSource = context.Policies.Where(p => p.InsuranceTypes.TypeName == "КАСКО").ToList();
                currentFilter = "КАСКО";
            }
        }
    }
}
