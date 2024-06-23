using ArchiveVSK.Classes;
using System;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;

namespace ArchiveVSK.Pages
{
    /// <summary>
    /// Логика взаимодействия для SelectedPolicy.xaml
    /// </summary>
    public partial class SelectedPolicy : Page
    {
        private Policies _policie;
        private Main _mainPage;
        private ArchiveVSKEntities _context = ArchiveVSKEntities.GetContext();
        private Policies _currentPolicy;

        public SelectedPolicy(Main mainPage, Policies policies)
        {
            InitializeComponent();
            _mainPage = mainPage;
            _policie = policies ?? new Policies();
            DataContext = _policie;

            _policie.StartDate = DateTime.Today;

            Brand.ItemsSource = _context.Brands.ToList();
            TypePol.ItemsSource = _context.InsuranceTypes.ToList();

            int policyId = _policie.PolicyID;

            LoadPolicyData(policyId);
        }
        private void LoadPolicyData(int policyId)
        {
            _currentPolicy = _context.Policies.FirstOrDefault(p => p.PolicyID == policyId);
            if (_currentPolicy != null)
            {
                Brand.SelectedValue = _currentPolicy.Cars.BrandID;
                Model.ItemsSource = _context.CarModels.Where(m => m.BrandID == _currentPolicy.Cars.BrandID).ToList();
                Model.SelectedValue = _currentPolicy.Cars.ModelID;
                TypePol.SelectedValue = _currentPolicy.InsuranceTypeID;
                StartDate.SelectedDate = _currentPolicy.StartDate;
                EndDate.SelectedDate = _currentPolicy.EndDate;
            }
        }
        private void Brand_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (Brand.SelectedValue != null)
            {
                int selectedBrandId = (int)Brand.SelectedValue;
                Model.ItemsSource = _context.CarModels.Where(m => m.BrandID == selectedBrandId).ToList();
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

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            ClassFrame.frmObj.GoBack();
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(LastName.Text) || string.IsNullOrWhiteSpace(FirstName.Text) ||
                string.IsNullOrWhiteSpace(Address.Text) || string.IsNullOrWhiteSpace(NumPhone.Text) ||
                string.IsNullOrWhiteSpace(Email.Text) || Brand.SelectedItem == null ||
                Model.SelectedItem == null || TypePol.SelectedItem == null ||
                string.IsNullOrWhiteSpace(NumPol.Text) || string.IsNullOrWhiteSpace(GosNum.Text) ||
                string.IsNullOrWhiteSpace(VIN.Text) || string.IsNullOrWhiteSpace(YearRelCar.Text) || string.IsNullOrWhiteSpace(Total.Text))
            {
                MessageBox.Show("Необходимо заполнить все поля", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (!DateTime.TryParse(StartDate.Text, out DateTime startDate) ||
                !DateTime.TryParse(EndDate.Text, out DateTime endDate))
            {
                MessageBox.Show("Некорректно введена дата", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            try
            {
                Clients newClient = new Clients
                {
                    LastName = LastName.Text,
                    FirstName = FirstName.Text,
                    Patronymic = Patronymic.Text,
                    DateOfBirth = DateOfBirth.SelectedDate ?? DateTime.Now,
                    Address = Address.Text,
                    PhoneNumber = NumPhone.Text,
                    Email = Email.Text
                };

                Cars newCar = new Cars
                {
                    BrandID = (int)Brand.SelectedValue,
                    ModelID = (int)Model.SelectedValue,
                    YearRelease = int.Parse(YearRelCar.Text),
                    VIN = VIN.Text,
                    RegistrationNumber = GosNum.Text
                };

                using (var context = new ArchiveVSKEntities())
                {
                    context.Clients.Add(newClient);
                    context.SaveChanges();

                    int newClientId = newClient.ClientID;

                    newClient.CarID = newCar.CarID;

                    context.Cars.Add(newCar);
                    context.SaveChanges();

                    int newCarId = newCar.CarID;

                    Policies newPolicy = new Policies
                    {
                        PolicyNumber = NumPol.Text,
                        ClientID = newClientId,
                        InsuranceTypeID = (int)TypePol.SelectedValue,
                        CarID = newCarId,
                        StartDate = startDate,
                        EndDate = endDate,
                        CostPolicy = int.Parse(Total.Text)
                    };

                    context.Policies.Add(newPolicy);
                    context.SaveChanges();

                    MessageBox.Show("Данные успешно сохранены в базу данных.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);

                    ClassFrame.frmObj.Navigate(new Main());
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Произошла ошибка при сохранении данных: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void YearRelCar_PreviewTextInput(object sender, System.Windows.Input.TextCompositionEventArgs e)
        {
            e.Handled = !IsTextAllowed(e.Text, @"^[0-9]+$");
        }

        private void LastName_PreviewTextInput(object sender, System.Windows.Input.TextCompositionEventArgs e)
        {
            e.Handled = !IsTextAllowed(e.Text, @"^[А-Яа-яЁёA-Za-z]+$");
        }

        private void NumPhone_PreviewTextInput(object sender, System.Windows.Input.TextCompositionEventArgs e)
        {
            e.Handled = !IsTextAllowed(e.Text, @"^[0-9]+$");
        }

        private void Email_PreviewTextInput(object sender, System.Windows.Input.TextCompositionEventArgs e)
        {
            e.Handled = !IsTextAllowed(e.Text, @"^[a-zA-Z0-9@._-]+$");
        }

        private bool IsTextAllowed(string text, string pattern)
        {
            return Regex.IsMatch(text, pattern);
        }
    }
}
