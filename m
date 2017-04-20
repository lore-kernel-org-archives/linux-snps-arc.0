From: Vladislav.Zakharov@synopsys.com (Vlad Zakharov)
Date: Thu, 20 Apr 2017 15:13:41 +0000
Subject: [PATCH v2] clk/axs10x: introduce AXS10X pll driver
In-Reply-To: <20170419164949.GH7065@codeaurora.org>
References: <1487682670-4164-1-git-send-email-vzakhar@synopsys.com>
 <20170405013525.GJ18246@codeaurora.org>
 <1491408370.9650.24.camel@synopsys.com>
 <20170419164949.GH7065@codeaurora.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1492701221.18176.51.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Stephen,

On Wed, 2017-04-19@09:49 -0700, sboyd@codeaurora.org wrote:
> On 04/05, Vlad Zakharov wrote:
> > 
> > Hi Stephen,
> > 
> > On Tue, 2017-04-04@18:35 -0700, Stephen Boyd wrote:
> > > 
> > > > 
> > > > +?????.pll_table = (struct pll_of_table []){
> > > > +?????????????{
> > > > +?????????????????????.prate = 27000000,
> > > 
> > > Can this be another clk in the framework instead of hardcoding
> > > the parent rate?
> > 
> > In fact there is another clk in the framework that represents this parent clock. But this field is needed to get
> > appropriate pll_cfg_table as it depends on parent clock frequency. Below in pll_cfg_get function we are searching
> > for
> > the correct table comparing .parent_node field with real hardware parent clock frequency:
> > ---------------------------------->8------------------------------------
> > for (i = 0; pll_table[i].prate != 0; i++)
> > ? ? if (pll_table[i].prate == prate)
> > ? ? ? ? return pll_table[i].pll_cfg_table;
> > ---------------------------------->8------------------------------------
> 
> When is that done though? During round_rate and recalc_rate the
> parent frequency is passed into the function, so it should be
> possible to use that if the tree is properly expressed.
> 

I think that we haven't understood each other correctly.
Anyway I have checked out our hardware documentations and find out that in fact for today's version of hardware we don't
have situations when such plls can be driven by different parent clock. So this approach is not required at the moment.
I am going to simplify my driver so it will reflect current version of hardware and if anything changes I will better
provide a new patch.

> > Sure. Could you be so kind to explain what is the difference between hw and non-hw based provider and clk
> > registration
> > functions please? In which cases they are preferred??
> > 
> 
> We're trying to split the consumer and provider APIs along struct
> clk_hw and struct clk respectively. If we can have drivers only
> registers clk_hw pointers and never get back anything but an
> error code, then we can force consumers to always go through the
> clk_get() family of APIs. Then we can easily tell who is a
> provider, who is a consumer, and who is a provider + a consumer.
> Right now this isn't always clear cut because clk_hw has access
> to struct clk, and also clk_register() returns a clk pointer, but
> it doesn't really get used by anything in a provider driver,
> unless provider drivers are doing something with the consumer
> API.

I am sorry for my foolish questions, but as I understand I should use hw-based functions for clk providers but it is not
still clear enough for me when should I use non-hw functions? Does any drivers need struct clk when they are initiating
or probing themselves? And what clk consumer can be used for?

> 
> > 
> > > 
> > > 
> > > > 
> > > > +}
> > > > +
> > > > +CLK_OF_DECLARE(axs10x_pll_clock, "snps,axs10x-arc-pll-clock", of_pll_clk_setup);
> > > 
> > > Does this need to be CLK_OF_DECLARE_DRIVER? I mean does the
> > > driver need to probe and also have this of declare happen? Is the
> > > PLL special and needs to be used for the timers?
> > 
> > It is special and is used for the timers, so we have to CLK_OF_DECLARE it. On the other hand similar pll is used to
> > drive PGU clock frequency and other subsystems and so we add usual probe func.
> > 
> 
> Presumably we'll have different compatible strings for the
> different PLLs then? CLK_OF_DECLARE() will make it so that the
> device node that matches never gets a ->probe() from a
> platform_driver called on it. If you want it to be called twice,
> then you need to use CLK_OF_DECLARE_DRIVER() instead.
> 

In fact we don't need it to be called twice. And as you can see I do practically the same things in setup and probe
functions. So maybe I can somehow avoid this code duplication??
I mean that this driver is going either to be used for the timers or as a simple platform driver for clocking some
peripheras. So for the first case I have written a setup function to CLK_OF_DECLARE my driver and for the second case
I've written usual probe function. Maybe I am mistaken and it is not the right way?

Thank you for you answers.?

-- 
Best regards,
Vlad Zakharov <vzakhar at synopsys.com>
