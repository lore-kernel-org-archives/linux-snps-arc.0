From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 10 Oct 2018 16:13:01 +0000
Subject: [PATCH] ARC: remove redundant 'default n' from Kconfig
References: <CGME20181010144619eucas1p2e4e6d3c43dd12e5b9cec7a29c4bf95ad@eucas1p2.samsung.com>
 <20181010144619eucas1p2e4e6d3c43dd12e5b9cec7a29c4bf95ad~cRpUq8hi71426914269eucas1p2J@eucas1p2.samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B0ABCBC@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/10/2018 07:46 AM, Bartlomiej Zolnierkiewicz wrote:
> 'default n' is the default value for any bool or tristate Kconfig
> setting so there is no need to write it explicitly.
>
> Also since commit f467c5640c29 ("kconfig: only write '# CONFIG_FOO
> is not set' for visible symbols") the Kconfig behavior is the same
> regardless of 'default n' being present or not:
>
>     ...
>     One side effect of (and the main motivation for) this change is making
>     the following two definitions behave exactly the same:
>     
>         config FOO
>                 bool
>     
>         config FOO
>                 bool
>                 default n
>     
>     With this change, neither of these will generate a
>     '# CONFIG_FOO is not set' line (assuming FOO isn't selected/implied).
>     That might make it clearer to people that a bare 'default n' is
>     redundant.
>     ...
>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie at samsung.com>

Nice ! Thx for you patch.
Applied to for-curr

-Vineet
