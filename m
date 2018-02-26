From: andy.shevchenko@gmail.com (Andy Shevchenko)
Date: Mon, 26 Feb 2018 16:40:34 +0200
Subject: [PATCH 1/2 v3] mmc: dw_mmc: Fix the DTO timeout overflow
 calculation for 32-bit systems
In-Reply-To: <20180226143413.44134-2-Evgeniy.Didin@synopsys.com>
References: <20180226143413.44134-1-Evgeniy.Didin@synopsys.com>
 <20180226143413.44134-2-Evgeniy.Didin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAHp75Vepn=nS9=WRpKhPLQ04EJEpL0tcne-DfV6ip-ELH9ggRA@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Feb 26, 2018 at 4:34 PM, Evgeniy Didin
<Evgeniy.Didin@synopsys.com> wrote:
> In commit 9d9491a7da2a ("mmc: dw_mmc: Fix the DTO timeout calculation") have been made
> changes which cause multiply overflow for 32-bit systems.
> The broken timeout calculations caused false interrupt latency warnings
> and stacktrace splat (such as below) when accessing the SD Card.

> +       drto_ms = DIV_ROUND_UP((u64)MSEC_PER_SEC * drto_clks * drto_div,
>                                host->bus_hz);

Same as per patch 2.

-- 
With Best Regards,
Andy Shevchenko
