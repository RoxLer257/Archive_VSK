using ArchiveVSK.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace ArchiveVSK.Pages
{
    /// <summary>
    /// Логика взаимодействия для AdminPage.xaml
    /// </summary>
    public partial class AdminPage : Page
    {
        private Classes.ArchiveVSKEntities archiveVSKEntities;
        public AdminPage()
        {
            InitializeComponent();
            LtvUsers.ItemsSource = Classes.ArchiveVSKEntities.GetContext().Users.ToList();
            archiveVSKEntities = ArchiveVSKEntities.GetContext();
            RoleComboBox.ItemsSource = archiveVSKEntities.Roles.ToList();
        }

        private void CreateButton_Click(object sender, RoutedEventArgs e)
        {
            var login = LoginTextBox.Text;
            var password = PasswordTextBox.Text;
            var role = (RoleComboBox.SelectedItem as Roles)?.RoleID ?? -1;

            var allowedRoles = new List<int> { 2, 3 };

            if (string.IsNullOrEmpty(login) || string.IsNullOrEmpty(password))
            {
                MessageBox.Show("Не правильно заполнены данные", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (!allowedRoles.Contains(role))
            {
                MessageBox.Show("Выбранная роль не разрешена", "Ошибка при создании пользователя",
                    MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            var user = new Users { Username = login, Password = password, Role_ID = role };

            if (!PasswordValidator.IsPasswordValid(password))
            {
                PasswordTextBox.Clear();
                PasswordTextBox.ToolTip = "Пароль не соответствует требованиям";
                PasswordTextBox.Background = Brushes.Red;
                MessageBox.Show("Пароль не соответствует требованиям", "Ошибка при авторизации",
                    MessageBoxButton.OK, MessageBoxImage.Error);
                LoginTextBox.Background = Brushes.Transparent;
                return;
            }

            try
            {
                archiveVSKEntities.Users.Add(user);
                archiveVSKEntities.SaveChanges();
                MessageBox.Show("Пользователь успешно создан");

                LtvUsers.ItemsSource = archiveVSKEntities.Users.ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Произошла ошибка: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
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

        private void DelUser_Click(object sender, RoutedEventArgs e)
        {
            var selectedUser = LtvUsers.SelectedItem as Users;
            if(selectedUser != null)
            {
                archiveVSKEntities.Users.Remove(selectedUser);
                archiveVSKEntities.SaveChanges();
                RefreshUser();
            }
        }

        private void RefreshUser()
        {
            try
            {
                LtvUsers.ItemsSource = archiveVSKEntities.Users.ToList();
            }
            catch
            {
                MessageBox.Show("Ошибка");
            }
        }
    }
}
