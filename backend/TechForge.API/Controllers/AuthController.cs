using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TechForge.Application.DTOs.Auth;
using TechForge.Application.Interfaces;

namespace TechForge.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IAuthService _authService;

        public AuthController(IAuthService authService)
        {
            _authService = authService;
        }

        [HttpPost("register")]
        public async Task<ActionResult<AuthResponse>> Register(RegisterRequest request)
        {
            var result = await _authService.RegisterAsync(request);

            return Ok(result);
        }

    }
}
