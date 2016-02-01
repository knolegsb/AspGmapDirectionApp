using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AspGmapDirectionApp.Startup))]
namespace AspGmapDirectionApp
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
