using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PW_Final.Startup))]
namespace PW_Final
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
