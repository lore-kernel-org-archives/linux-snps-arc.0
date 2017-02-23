From: viresh.kumar@linaro.org (Viresh Kumar)
Date: Thu, 23 Feb 2017 10:24:45 +0530
Subject: cpufreq: get cpufreq_frequency_table from clk driver
In-Reply-To: <1487675614.25108.30.camel@synopsys.com>
References: <1487675614.25108.30.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170223045445.GA21911@vireshk-i7>
To: linux-snps-arc@lists.infradead.org

On 21-02-17, 11:13, Vlad Zakharov wrote:
> Hello,
> 
> I am trying to implement a cpufreq driver for ARCHS cpu.

You mean ARC architecture here ?

> And I faced with one question I am not able to answer myself. cpufreq framework allows us using cpufreq frequency tables
> that store available for current policy range of frequencies with any additional data. As I understand for example it
> can be clock configurations for this particular frequency.

Yes, it can be any platform specific data. Yes, but it is better
handled by the clk driver in your case and cpufreq driver just needs
to call clk_set_rate().

> Also I have a clk driver that manages actual cpu frequency. In fact it uses very similar tables that contain frequencies
> and corresponding values of clock configurations registers that are to be set up with current frequency.

Good.

> So the question is can I get such tables from clk driver somehow? I would be very convenient: this tables differs for
> ARCHS CPU. E.g. on different boards it is clocked by different PLLs and oscillators.

Not that I am aware of. Just make copies for every board or if you can
use device tree, get it using OPP tables.

-- 
viresh
