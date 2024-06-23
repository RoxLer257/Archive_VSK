using ArchiveVSK.Classes;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
namespace ArchiveVSK.Pages
{
    /// <summary>
    /// Логика взаимодействия для Authorization.xaml
    /// </summary>
    public partial class Authorization : Page
    {
        public Authorization()
        {
            InitializeComponent();
        }

        private void BtnEnter_Click(object sender, RoutedEventArgs e)
        {
            string login = txtLogin.Text;
            string password = txtpass.Password;

            if (string.IsNullOrWhiteSpace(login) || string.IsNullOrWhiteSpace(password))
            {
                MessageBox.Show("Необходимо заполнить все поля", "Ошибка при авторизации",
                    MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (!PasswordValidator.IsPasswordValid(password))
            {
                txtpass.Clear();
                txtpass.ToolTip = "Пароль не соответствует требованиям";
                txtpass.Background = Brushes.Red;
                MessageBox.Show("Пароль не соответствует требованиям", "Ошибка при авторизации",
                    MessageBoxButton.OK, MessageBoxImage.Error);
                txtLogin.Background = Brushes.Transparent;
                return;
            }

            try
            {
                using (var context = new ArchiveVSKEntities())
                {
                    var user = context.Users.FirstOrDefault(u => u.Username == login);

                    if (user == null || !string.Equals(user.Username, login, StringComparison.Ordinal))
                    {
                        txtLogin.ToolTip = "Неверный логин";
                        txtLogin.Background = Brushes.Red;
                        MessageBox.Show("Неверный логин", "Ошибка при авторизации",
                            MessageBoxButton.OK, MessageBoxImage.Error);
                        txtLogin.Background = Brushes.Transparent;
                        return;
                    }

                    if (user.Role_ID == 1)
                    {
                        MessageBox.Show("Вы должны использовать кнопку 'Войти как администратор' для входа", "Ошибка при авторизации",
                            MessageBoxButton.OK, MessageBoxImage.Error);
                        txtLogin.Background = Brushes.Transparent;
                        return;
                    }

                    if (user.Password != password)
                    {
                        txtpass.Clear();
                        txtpass.ToolTip = "Неправильный пароль";
                        txtpass.Background = Brushes.Red;
                        MessageBox.Show("Неправильный пароль", "Ошибка при авторизации",
                            MessageBoxButton.OK, MessageBoxImage.Error);
                        txtpass.Background = Brushes.Transparent;
                        return;
                    }

                    ClassFrame.RoleID = user.UserID;
                    CurrentUser.Username = user.Username;
                    CurrentUser.Password = user.Password;
                    CurrentUser.RoleName = context.Roles.FirstOrDefault(r => r.RoleID == user.Role_ID)?.RoleName;
                    ClassFrame.frmObj.Navigate(new Main());
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Произошла ошибка: {ex.Message}", "Ошибка при авторизации",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BtnEnterAdm_Click(object sender, RoutedEventArgs e)
        {
            string login = txtLogin.Text;
            string password = txtpass.Password;

            if (string.IsNullOrWhiteSpace(login) || string.IsNullOrWhiteSpace(password))
            {
                MessageBox.Show("Необходимо заполнить все поля", "Ошибка при авторизации",
                    MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (!PasswordValidator.IsPasswordValid(password))
            {
                txtpass.Clear();
                txtpass.ToolTip = "Пароль не соответствует требованиям";
                txtpass.Background = Brushes.Red;
                MessageBox.Show("Пароль не соответствует требованиям", "Ошибка при авторизации",
                    MessageBoxButton.OK, MessageBoxImage.Error);
                txtLogin.Background = Brushes.Transparent;
                return;
            }

            try
            {
                using (var context = new ArchiveVSKEntities())
                {
                    var user = context.Users.FirstOrDefault(u => u.Username == login);

                    if (user == null || !string.Equals(user.Username, login, StringComparison.Ordinal))
                    {
                        txtLogin.ToolTip = "Неверный логин";
                        txtLogin.Background = Brushes.Red;
                        MessageBox.Show("Неверный логин", "Ошибка при авторизации",
                            MessageBoxButton.OK, MessageBoxImage.Error);
                        txtLogin.Background = Brushes.Transparent;
                        return;
                    }

                    if (user.Role_ID != 1)
                    {
                        MessageBox.Show("Вы должны использовать кнопку 'Войти' для входа", "Ошибка при авторизации",
                            MessageBoxButton.OK, MessageBoxImage.Error);
                        txtLogin.Background = Brushes.Transparent;
                        return;
                    }

                    if (user.Password != password)
                    {
                        txtpass.Clear();
                        txtpass.ToolTip = "Неправильный пароль";
                        txtpass.Background = Brushes.Red;
                        MessageBox.Show("Неправильный пароль", "Ошибка при авторизации",
                            MessageBoxButton.OK, MessageBoxImage.Error);
                        txtLogin.Background = Brushes.Transparent;
                        return;
                    }

                    ClassFrame.RoleID = user.UserID;
                    CurrentUser.Username = user.Username;
                    CurrentUser.Password = user.Password;
                    CurrentUser.RoleName = context.Roles.FirstOrDefault(r => r.RoleID == user.Role_ID)?.RoleName;
                    ClassFrame.frmObj.Navigate(new AdminPage());
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Произошла ошибка: {ex.Message}", "Ошибка при авторизации",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BtnReg_Click(object sender, RoutedEventArgs e)
        {
            ForgotUPass forgotUPassWindow = new ForgotUPass();
            forgotUPassWindow.Show();
        }
    }
}
