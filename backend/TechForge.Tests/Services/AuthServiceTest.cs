using Microsoft.Extensions.Logging;
using Moq;
using TechForge.Application.DTOs.Auth;
using TechForge.Application.Exceptions;
using TechForge.Application.Interfaces;
using TechForge.Application.Services;
using TechForge.Domain.Entities;

namespace TechForge.Tests.Services;

public class AuthServiceTests
{
    private readonly Mock<IUserRepository> _userRepositoryMock;
    private readonly Mock<IPasswordHasher> _passwordHasherMock;
    private readonly Mock<ITokenService> _tokenServiceMock;
    private readonly Mock<ILogger<AuthService>> _loggerMock;

    private readonly AuthService _authService;

    public AuthServiceTests()
    {
        _userRepositoryMock = new Mock<IUserRepository>();
        _passwordHasherMock = new Mock<IPasswordHasher>();
        _tokenServiceMock = new Mock<ITokenService>();
        _loggerMock = new Mock<ILogger<AuthService>>();

        _authService = new AuthService(
            _userRepositoryMock.Object,
            _passwordHasherMock.Object,
            _tokenServiceMock.Object,
            _loggerMock.Object);
    }

    [Fact]
    public async Task RegisterAsync_ShouldRegisterUser_WhenEmailDoesNotExist()
    {

        var request = new RegisterRequest
        {
            FirstName = "Deepak",
            LastName = "Karthikeyan",
            Email = "deepak@example.com",
            Password = "Password123"
        };

        var hashedPassword = "hashed-password";
        var token = "test-jwt-token";

        _userRepositoryMock
            .Setup(x => x.GetByEmailAsync(request.Email))
            .ReturnsAsync((User?)null);

        _passwordHasherMock
            .Setup(x => x.HashPassword(request.Password))
            .Returns(hashedPassword);

        _tokenServiceMock
            .Setup(x => x.CreateToken(It.IsAny<User>()))
            .Returns(token);


        var result = await _authService.RegisterAsync(request);


        Assert.NotNull(result);

        Assert.Equal(request.FirstName, result.FirstName);
        Assert.Equal(request.LastName, result.LastName);
        Assert.Equal(
            request.Email.ToLowerInvariant(),
            result.Email);

        Assert.Equal(token, result.Token);

        _userRepositoryMock.Verify(
            x => x.GetByEmailAsync(request.Email),
            Times.Once);

        _passwordHasherMock.Verify(
            x => x.HashPassword(request.Password),
            Times.Once);

        _userRepositoryMock.Verify(
            x => x.AddAsync(It.Is<User>(user =>
                user.FirstName == request.FirstName &&
                user.LastName == request.LastName &&
                user.Email == request.Email.ToLowerInvariant() &&
                user.PasswordHash == hashedPassword)),
            Times.Once);

        _userRepositoryMock.Verify(
            x => x.SaveChangesAsync(),
            Times.Once);

        _tokenServiceMock.Verify(
            x => x.CreateToken(It.IsAny<User>()),
            Times.Once);
    }

    [Fact]
    public async Task RegisterAsync_ShouldThrowConflictException_WhenEmailAlreadyExists()
    {

        var request = new RegisterRequest
        {
            FirstName = "Deepak",
            LastName = "Karthikeyan",
            Email = "deepak@example.com",
            Password = "Password123"
        };

        var existingUser = new User
        {
            Id = 1,
            FirstName = "Existing",
            LastName = "User",
            Email = request.Email,
            PasswordHash = "existing-hash"
        };

        _userRepositoryMock
            .Setup(x => x.GetByEmailAsync(request.Email))
            .ReturnsAsync(existingUser);


        var exception = await Assert.ThrowsAsync<ConflictException>(
            () => _authService.RegisterAsync(request));

        Assert.Equal(
            "A user with this email already exists.",
            exception.Message);

        _userRepositoryMock.Verify(
            x => x.AddAsync(It.IsAny<User>()),
            Times.Never);

        _userRepositoryMock.Verify(
            x => x.SaveChangesAsync(),
            Times.Never);

        _passwordHasherMock.Verify(
            x => x.HashPassword(It.IsAny<string>()),
            Times.Never);

        _tokenServiceMock.Verify(
            x => x.CreateToken(It.IsAny<User>()),
            Times.Never);
    }

    [Fact]
    public async Task LoginAsync_ShouldReturnAuthResponse_WhenCredentialsAreValid()
    {

        var request = new LoginRequest
        {
            Email = "deepak@example.com",
            Password = "Password123"
        };

        var user = new User
        {
            Id = 1,
            FirstName = "Deepak",
            LastName = "Karthikeyan",
            Email = "deepak@example.com",
            PasswordHash = "hashed-password"
        };

        var token = "test-jwt-token";

        _userRepositoryMock
            .Setup(x => x.GetByEmailAsync(request.Email))
            .ReturnsAsync(user);

        _passwordHasherMock
            .Setup(x => x.VerifyPassword(
                request.Password,
                user.PasswordHash))
            .Returns(true);

        _tokenServiceMock
            .Setup(x => x.CreateToken(user))
            .Returns(token);


        var result = await _authService.LoginAsync(request);


        Assert.NotNull(result);

        Assert.Equal(user.Id, result.Id);
        Assert.Equal(user.FirstName, result.FirstName);
        Assert.Equal(user.LastName, result.LastName);
        Assert.Equal(user.Email, result.Email);
        Assert.Equal(user.Role, result.Role);
        Assert.Equal(token, result.Token);

        _userRepositoryMock.Verify(
            x => x.GetByEmailAsync(request.Email),
            Times.Once);

        _passwordHasherMock.Verify(
            x => x.VerifyPassword(
                request.Password,
                user.PasswordHash),
            Times.Once);

        _tokenServiceMock.Verify(
            x => x.CreateToken(user),
            Times.Once);
    }

    [Fact]
    public async Task LoginAsync_ShouldThrowUnauthorizedAccessException_WhenUserDoesNotExist()
    {

        var request = new LoginRequest
        {
            Email = "unknown@example.com",
            Password = "Password123"
        };

        _userRepositoryMock
            .Setup(x => x.GetByEmailAsync(request.Email))
            .ReturnsAsync((User?)null);

        var exception = await Assert.ThrowsAsync<UnauthorizedAccessException>(
            () => _authService.LoginAsync(request));

        Assert.Equal(
            "Invalid Email or Password!",
            exception.Message);

        _passwordHasherMock.Verify(
            x => x.VerifyPassword(
                It.IsAny<string>(),
                It.IsAny<string>()),
            Times.Never);

        _tokenServiceMock.Verify(
            x => x.CreateToken(It.IsAny<User>()),
            Times.Never);
    }

    [Fact]
    public async Task LoginAsync_ShouldThrowUnauthorizedAccessException_WhenPasswordIsInvalid()
    {

        var request = new LoginRequest
        {
            Email = "deepak@example.com",
            Password = "WrongPassword123"
        };

        var user = new User
        {
            Id = 1,
            FirstName = "Deepak",
            LastName = "Karthikeyan",
            Email = request.Email,
            PasswordHash = "hashed-password"
        };

        _userRepositoryMock
            .Setup(x => x.GetByEmailAsync(request.Email))
            .ReturnsAsync(user);

        _passwordHasherMock
            .Setup(x => x.VerifyPassword(
                request.Password,
                user.PasswordHash))
            .Returns(false);

        var exception = await Assert.ThrowsAsync<UnauthorizedAccessException>(
            () => _authService.LoginAsync(request));

        Assert.Equal(
            "Invalid Email or Password!",
            exception.Message);

        _tokenServiceMock.Verify(
            x => x.CreateToken(It.IsAny<User>()),
            Times.Never);
    }
}