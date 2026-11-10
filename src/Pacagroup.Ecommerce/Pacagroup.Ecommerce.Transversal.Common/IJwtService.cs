using Pacagroup.Ecommerce.Domain.Entity;

namespace Pacagroup.Ecommerce.Transversal.Common
{
    public interface IJwtService
    {
        string GenerateToken(User user);
    }
}
