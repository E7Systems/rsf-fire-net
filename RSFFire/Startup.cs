using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(RSFFire.Startup))]
namespace RSFFire
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
