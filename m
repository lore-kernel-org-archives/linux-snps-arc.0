From: raj.khem@gmail.com (Khem Raj)
Date: Mon, 12 Nov 2018 09:42:54 -0800
Subject: [PATCH] packagegroup-core-sdk: Disable SANITIZERS for ARC
In-Reply-To: <20181112130938.7781-1-abrodkin@synopsys.com>
References: <20181112130938.7781-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAMKF1sp1hfayuo==2fJO_75ccN+rLzHAPSP2Q8g2SYkvuA6Xew@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

Looks ok to me
On Mon, Nov 12, 2018 at 5:09 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> Sanitizers are not yet supported on ARC.
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> ---
>  meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> index 45e8c13585..15d0989b76 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> @@ -27,6 +27,7 @@ RDEPENDS_packagegroup-core-sdk = "\
>      tcl"
>
>  SANITIZERS = "libasan-dev libubsan-dev"
> +SANITIZERS_arc = ""
>  SANITIZERS_microblaze = ""
>  SANITIZERS_mipsarch = ""
>  SANITIZERS_nios2 = ""
> --
> 2.16.2
>
