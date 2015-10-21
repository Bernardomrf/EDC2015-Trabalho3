using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EDC2015_Trabalho3.Startup))]
namespace EDC2015_Trabalho3
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
