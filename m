From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 31 Oct 2016 17:45:32 -0700
Subject: [PATCH 9/9] clocksource: import ARC timer driver
In-Reply-To: <201611010729.RHZWyA5l%fengguang.wu@intel.com>
References: <1477954096-770-10-git-send-email-vgupta@synopsys.com>
 <201611010729.RHZWyA5l%fengguang.wu@intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <6dac5b54-dd48-3c23-94af-b5fceef8269e@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/31/2016 05:01 PM, kbuild test robot wrote:
> Hi Vineet,
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v4.9-rc3]
> [cannot apply to arc/for-next]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> [Suggest to use git(>=2.9.0) format-patch --base=<commit> (or --base=auto for convenience) to record what (public, well-known) commit your patch series was built on]
> [Check https://git-scm.com/docs/git-format-patch for more information]
> 
> url:    https://github.com/0day-ci/linux/commits/Vineet-Gupta/Move-ARC-timer-code-into-drivers-clocksource/20161101-065452
> config: ia64-allmodconfig (attached as .config)
> compiler: ia64-linux-gcc (GCC) 6.2.0
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=ia64 
> 
> All error/warnings (new ones prefixed by >>):
> 
>>> >> drivers/clocksource/arc_timer.c:237:19: warning: 'struct clock_event_device' declared inside parameter list will not be visible outside of this definition or declaration
>                struct clock_event_device *dev)
>                       ^~~~~~~~~~~~~~~~~~
>    drivers/clocksource/arc_timer.c:243:45: warning: 'struct clock_event_device' declared inside parameter list will not be visible outside of this definition or declaration

So I'd build tested the series for ARM (32 bit) and x86 (64 bit).
Seems this requires a depends on GENERIC_CLOCKEVENTS. Will fix it along with other
comments !

Thx for reporting.
-Vineet
