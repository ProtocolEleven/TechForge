using FluentValidation;

namespace TechForge.API.Exceptions
{
    public class ExceptionResponseFactory
    {
        public static ApiErrorResponse Create(
        Exception exception,
        string traceId,
        out int statusCode)
        {
            switch (exception)
            {
                case ValidationException validationException:

                    statusCode = StatusCodes.Status400BadRequest;

                    return new ApiErrorResponse
                    {
                        StatusCode = statusCode,
                        Message = "Validation failed.",
                        Errors = validationException.Errors
                            .Select(x => x.ErrorMessage)
                            .ToList(),
                        TraceId = traceId
                    };

                case KeyNotFoundException:

                    statusCode = StatusCodes.Status404NotFound;

                    return new ApiErrorResponse
                    {
                        StatusCode = statusCode,
                        Message = exception.Message,
                        TraceId = traceId
                    };

                case InvalidOperationException:

                    statusCode = StatusCodes.Status409Conflict;

                    return new ApiErrorResponse
                    {
                        StatusCode = statusCode,
                        Message = exception.Message,
                        TraceId = traceId
                    };

                default:

                    statusCode = StatusCodes.Status500InternalServerError;

                    return new ApiErrorResponse
                    {
                        StatusCode = statusCode,
                        Message = "An unexpected error occurred.",
                        TraceId = traceId
                    };
            }
        }
    }
}
