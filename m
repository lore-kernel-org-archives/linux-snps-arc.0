From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 15 Mar 2018 09:38:15 -0700
Subject: mmc: block: bonnie++ runs with errors on arc/hsdk board
In-Reply-To: <83de0f90-0919-f449-b432-494b9bf524a1@intel.com>
References: <1520942674.10285.8.camel@synopsys.com>
 <486fe92e-9b53-53a4-f98d-129a97032470@intel.com>
 <1520956602.10285.10.camel@synopsys.com>
 <1521030769.10285.16.camel@synopsys.com>
 <83de0f90-0919-f449-b432-494b9bf524a1@intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <345e9053-9251-ad27-d05b-ec80b69ee235@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 03/15/2018 02:27 AM, Adrian Hunter wrote:
> Please try:
> 
> 	perf record -a -e mmc:* -- bonnie++ -u root -r 256 -s 512 -x 1 -d /mnt
> 
> and share the resulting perf.data file when you are able
> to reproduce the hung task message.
> 
> You may want to add this patch first:
> 
> 	https://marc.info/?l=linux-mmc&m=152110580324200

While this SoC has perf counters, Unfortunately the overflow interrupts are not 
wired up. We can do perf stats but not sampling.

Peter was it you or Vince trying to use timer interrupts to emulate perf sampling 
on some ARM SoC ?

Thing is we have a spare hardware timer per core (TIMER1) which is not usabel for 
otherwise gtod function in SMP and could well be repurposed for perf needs.

-Vineet
