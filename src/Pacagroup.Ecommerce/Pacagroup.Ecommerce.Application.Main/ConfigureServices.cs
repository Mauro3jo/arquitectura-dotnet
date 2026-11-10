using Microsoft.Extensions.DependencyInjection;
using Pacagroup.Ecommerce.Application.Interface;
using System.Reflection;

namespace Pacagroup.Ecommerce.Application.Main
{
    public static class ConfigureServices
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services)
        {
            services.AddScoped<ICustomersApplication, CustomersApplication>();
            services.AddAutoMapper(Assembly.GetExecutingAssembly());

            return services;
        }
    }
}
