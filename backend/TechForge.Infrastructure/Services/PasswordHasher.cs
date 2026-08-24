using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechForge.Application.Interfaces;
using TechForge.Domain.Entities;

namespace TechForge.Infrastructure.Services
{
    public class PasswordHasher : IPasswordHasher
    {
        private readonly PasswordHasher<User> _passwordHasher = new();
        public string HashPassword(string password)
        {
            return _passwordHasher.HashPassword(new User(), password);
        }

        public bool VerifyPassword(string password, string passwordHash)
        {
            var result = _passwordHasher.VerifyHashedPassword(new User(), passwordHash, password);

            return result != PasswordVerificationResult.Failed;
        }
    }
}
