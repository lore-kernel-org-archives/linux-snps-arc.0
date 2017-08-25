From: robh+dt@kernel.org (Rob Herring)
Date: Fri, 25 Aug 2017 13:07:30 -0500
Subject: [PATCH v2] OF: move extern declarations of of_stdout inside ifdef
In-Reply-To: <20170825165644.30800-1-Eugeniy.Paltsev@synopsys.com>
References: <20170825165644.30800-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAL_JsqJ4dPY0L21y8RwFfJVRvkdNi4uBWwsg6dOeyxru2dRFXQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Fri, Aug 25, 2017 at 11:56 AM, Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:
> Move extern declarations of "of_stdout" pointer inside "CONFIG_OF"
> ifdef to be able to get rid of "CONFIG_OF" ifdef in its usage places.
>
> Suggested-by: Steven Rostedt <rostedt at goodmis.org>
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
> For example see: https://lkml.org/lkml/2017/8/25/337
>
> Changes v1->v2:
>  * Move only "of_stdout" declarations instead of all entry pointers
>    declarations
>
>  include/linux/of.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh at kernel.org>

Merge this with the console change needing it.

Rob
