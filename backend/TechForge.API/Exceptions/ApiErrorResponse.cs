namespace TechForge.API.Exceptions
{
    public class ApiErrorResponse
    {
        public int StatusCode { get; init; }

        public string Message { get; init; } = string.Empty;

        public IReadOnlyCollection<string>? Errors { get; init; }

        public DateTime Timestamp { get; init; } = DateTime.UtcNow;

        public string? TraceId { get; init; }
    }
}
