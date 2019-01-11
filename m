From: raj.khem@gmail.com (Khem Raj)
Date: Fri, 11 Jan 2019 07:31:48 -0800
Subject: [PATCH] webkitgtk: Enable building for ARC architecture
In-Reply-To: <20190111125014.34593-1-abrodkin@synopsys.com>
References: <20190111125014.34593-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAMKF1soxmbmcHx4ZQkyx4aqoNYSApjU0wGTEntfsTm08Rg4Y8A@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Fri, Jan 11, 2019 at 4:50 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> For that we need 2 things:
>  1. Disable JIT in JS as it's not supported for ARC.
>
>  2. Compile with "-mlong-calls" so relocations with
>     offsets larger than 25 bits are used, otherwise
>     linker fails to link final binaries.
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Alexander Kanavin <alex.kanavin at gmail.com>
> Cc: Hongxu Jia <hongxu.jia at windriver.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.22.5.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
> index fc56822f7a..56f69c7a30 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
> @@ -69,6 +69,13 @@ EXTRA_OECMAKE = " \
>  EXTRA_OECMAKE_append_x86 = " -DUSE_GSTREAMER_GL=OFF "
>  EXTRA_OECMAKE_append_x86-x32 = " -DUSE_GSTREAMER_GL=OFF "
>
> +# Javascript JIT is not supported on ARC
> +EXTRA_OECMAKE_append_arc = " -DENABLE_JIT=OFF "
> +# By default 25-bit "medium" calls are used on ARC
> +# which is not enough for binaries larger than 32 MiB
> +CFLAGS_append_arc = " -mlong-calls"
> +CXXFLAGS_append_arc = " -mlong-calls"

perhaps adding to CPPFLAGS is going to be enough for both c/c++ cases

> +
>  # Javascript JIT is not supported on powerpc
>  EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
>  EXTRA_OECMAKE_append_powerpc64 = " -DENABLE_JIT=OFF "
> --
> 2.16.2
>
