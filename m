From: robh@kernel.org (Rob Herring)
Date: Fri, 25 Aug 2017 10:43:40 -0500
Subject: [PATCH] OF: move extern declarations of entry pointers inside
 ifdef
In-Reply-To: <20170825150027.25341-1-Eugeniy.Paltsev@synopsys.com>
References: <20170825150027.25341-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CABGGisxzNfCKM8JVa08n=Yn2MGZ_j9t98ZK4yEj2S0PxqqxdRQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Fri, Aug 25, 2017 at 10:00 AM, Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:
> Move extern declarations of "of_root", "of_chosen", "of_aliases",
> "of_stdout" pointers inside "CONFIG_OF" ifdef to be able to get rid
> of "CONFIG_OF" ifdef in their usage places.
>
> Suggested-by: Steven Rostedt <rostedt at goodmis.org>
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
> For example see: https://lkml.org/lkml/2017/8/25/337
>
>  include/linux/of.h | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/of.h b/include/linux/of.h
> index cfc3411..d117bf1 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -131,11 +131,6 @@ static inline struct device_node *of_node_get(struct device_node *node)
>  static inline void of_node_put(struct device_node *node) { }
>  #endif /* !CONFIG_OF_DYNAMIC */
>
> -/* Pointer for first entry in chain of all nodes. */
> -extern struct device_node *of_root;
> -extern struct device_node *of_chosen;
> -extern struct device_node *of_aliases;
> -extern struct device_node *of_stdout;

Just move what you need. Some of these I'd like to see be internal to
the DT code.

Rob
