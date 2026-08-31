using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechForge.Domain.Entities;

namespace TechForge.Application.Interfaces
{
    public interface ITokenService
    {
        string CreateToken(User user);
    }
}
