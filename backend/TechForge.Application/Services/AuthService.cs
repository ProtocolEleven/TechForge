using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechForge.Application.DTOs.Auth;
using TechForge.Application.Interfaces;
using TechForge.Domain.Entities;
using TechForge.Application.Exceptions;

namespace TechForge.Application.Services
{
    public class AuthService : IAuthService
    {
        private readonly IUserRepository _userRepository;
        private readonly IPasswordHasher _passwordHasher;
        private readonly ITokenService _tokenService;

        public AuthService(IUserRepository userRepository, IPasswordHasher passwordHasher, ITokenService tokenService)
        {
            _userRepository = userRepository;
            _passwordHasher = passwordHasher;
            _tokenService = tokenService;
        }

        public async Task<AuthResponse> LoginAsync(LoginRequest request)
        {
            var email = request.Email.Trim().ToLowerInvariant();

            var user = await _userRepository.GetByEmailAsync(email);

            if (user == null) 
            {
                throw new UnauthorizedAccessException("Invalid Email or Password!");
            }

            var passwordIsInvalid = _passwordHasher.VerifyPassword(
                request.Password,
                user.PasswordHash);

            if (!passwordIsInvalid) 
            {
                throw new UnauthorizedAccessException("Invalid Email or Password!");
            }

            var token = _tokenService.CreateToken(user);

            return new AuthResponse
            {
                Id = user.Id,
                FirstName = user.FirstName,
                LastName = user.LastName,
                Email = user.Email,
                Role = user.Role,
                Token = token
            };
        }

        public async Task<AuthResponse> RegisterAsync(RegisterRequest request)
        {
            var existingUser = await _userRepository.GetByEmailAsync(request.Email);

            if (existingUser != null) 
            {
                throw new ConflictException("A user with this email already exists.");
            }

            var user = new User
            {
                FirstName = request.FirstName.Trim(),
                LastName = request.LastName.Trim(),
                Email = request.Email.Trim().ToLowerInvariant(),
                PasswordHash = _passwordHasher.HashPassword(request.Password)
            };

            var token = _tokenService.CreateToken(user);

            await _userRepository.AddAsync(user);

            await _userRepository.SaveChangesAsync();

            return new AuthResponse
            {
                Id = user.Id,
                FirstName = user.FirstName,
                LastName = user.LastName,
                Email = user.Email,
                Role = user.Role,
                Token = token
            };
        }
    }
}
