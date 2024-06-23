using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArchiveVSK.Classes
{
    public static class PasswordValidator
    {
        public static bool IsPasswordValid(string password)
        {
            if(password.Length <6)
                return false;

            if(!password.Any(char.IsUpper))
                return false;

            if (!password.Any(char.IsDigit))
                return false;

            if(!password.Any(c => "!@#$%^".Contains(c)))
                return false;

            return true;
        }
    }
}
