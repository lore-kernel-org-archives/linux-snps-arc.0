From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 5 Mar 2018 15:56:37 +0000
Subject: [PATCH v2 1/2] dmaengine: Introduce DW AXI DMAC driver
In-Reply-To: <CAHp75Vc6KtppecYJBtuXTGCzXySOUZiYqxBfb6w69f1j3J0jDQ@mail.gmail.com>
References: <20180226145628.11892-1-Eugeniy.Paltsev@synopsys.com>
 <20180226145628.11892-2-Eugeniy.Paltsev@synopsys.com>
 <CAHp75Vc6KtppecYJBtuXTGCzXySOUZiYqxBfb6w69f1j3J0jDQ@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1520265396.3152.27.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Mon, 2018-02-26@18:42 +0200, Andy Shevchenko wrote:
> On Mon, Feb 26, 2018 at 4:56 PM, Eugeniy Paltsev
> <Eugeniy.Paltsev@synopsys.com> wrote:
> 
> > +       chip->core_clk = devm_clk_get(chip->dev, "core-clk");
> 
> Does the name come from datasheet?
> 
> > +       chip->cfgr_clk = devm_clk_get(chip->dev, "cfgr-clk");
> 
> Ditto?

Yes, these names came from datasheet.

> > +       }
> > +       /* Enable clk before accessing to registers */
> > +       clk_prepare_enable(chip->cfgr_clk);
> > +       clk_prepare_enable(chip->core_clk);
> 
> Each of them may fail. Is it okay?

As it is driver remove callback I guess it is okay.

> > +static const struct dev_pm_ops dw_axi_dma_pm_ops = {
> > +       SET_RUNTIME_PM_OPS(axi_dma_runtime_suspend, axi_dma_runtime_resume, NULL)
> > +};
> 
> No system suspend?

Are you talking about SET_SYSTEM_SLEEP_PM_OPS?
I don't implement these OPS as we don't have any platform which has DW AXI DMAC
and supports sleeping - so I can't test them.

-- 
 Eugeniy Paltsev
