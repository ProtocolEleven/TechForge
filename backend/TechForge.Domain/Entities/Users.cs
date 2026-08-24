using TechForge.Domain.Common;
using TechForge.Domain.Constants;

namespace TechForge.Domain.Entities;

public class User : BaseEntity
{
    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string PasswordHash { get; set; } = null!;

    public string Role { get; set; } = UserRoles.User;
}