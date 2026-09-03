using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechForge.Application.DTOs.Auth;
using TechForge.Application.Exceptions;
using TechForge.Application.Interfaces;
using TechForge.Domain.Entities;

namespace TechForge.Application.Services
{
    public class AuthService : IAuthService
    {
        private readonly IUserRepository _userRepository;
        private readonly IPasswordHasher _passwordHasher;
        private readonly ITokenService _tokenService;
        private readonly ILogger<AuthService> _logger;

        public AuthService(IUserRepository userRepository, IPasswordHasher passwordHasher, ITokenService tokenService, ILogger<AuthService> logger)
        {
            _userRepository = userRepository;
            _passwordHasher = passwordHasher;
            _tokenService = tokenService;
            _logger = logger;
        }

        public async Task<AuthResponse> LoginAsync(LoginRequest request)
        {
            _logger.LogInformation("Login attempt for email: {Email}", request.Email);

            var email = request.Email.Trim().ToLowerInvariant();

            var user = await _userRepository.GetByEmailAsync(email);

            if (user == null) 
            {
                _logger.LogWarning("Login failed for email: {Email}", email);

                throw new UnauthorizedAccessException("Invalid Email or Password!");
            }

            var passwordIsInvalid = _passwordHasher.VerifyPassword(
                request.Password,
                user.PasswordHash);

            if (!passwordIsInvalid) 
            {
                _logger.LogWarning("Login failed for email: {Email}", email);

                throw new UnauthorizedAccessException("Invalid Email or Password!");
            }  

            var token = _tokenService.CreateToken(user);

            _logger.LogInformation("User logged in successfully. UserId: {UserId}", user.Id);

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
                _logger.LogWarning("Registration failed because email already exists: {Email}", request.Email);

                throw new ConflictException("A user with this email already exists.");
            }

            _logger.LogInformation("Registration attempt for email: {Email}", request.Email);

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

            _logger.LogInformation("User registered successfully. UserId: {UserId}", user.Id);

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
