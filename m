From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 1 Apr 2019 17:53:20 +0000
Subject: [PATCH v2 1/5] arch/arc: unwind.c: replace swap function with
 built-in one
References: <19606671554056883@myt3-1179f584969c.qloud-c.yandex.net>
 <23405591554057090@iva8-b333b7f98ab0.qloud-c.yandex.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014643F9C4@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 3/31/19 11:31 AM, Andrey Abramov wrote:
> Replace swap_eh_frame_hdr_table_entries with built-in one, because
> swap_eh_frame_hdr_table_entries does a simple byte to byte swap.
>
> Since Spectre mitigations have made indirect function calls more
> expensive, and the default simple byte copies swap is implemented
> without them, an "optimized" custom swap function is now
> a waste of time as well as code.
>
> Signed-off-by: Andrey Abramov <st5pub at yandex.ru>
> Reviewed by: George Spelvin <lkml at sdf.org>
>

Acked-by: Vineet Gupta <vgupta at synopsys.com>

Thx,
-Vineet
