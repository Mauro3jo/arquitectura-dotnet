using Microsoft.Extensions.DependencyInjection;
using Pacagroup.Ecommerce.Application.Interface;
using Pacagroup.Ecommerce.Transversal.Common;
using System.Reflection;

namespace Pacagroup.Ecommerce.Application.Main
{
    public static class ConfigureServices
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services)
        {
            services.AddScoped<ICustomersApplication, CustomersApplication>();
            services.AddScoped<IAuthApplication, AuthApplication>();
            services.AddScoped<IJwtService, JwtService>();

            services.AddAutoMapper(cfg => { }, Assembly.GetExecutingAssembly());

            return services;
        }
    }
}
