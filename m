From: andy.shevchenko@gmail.com (Andy Shevchenko)
Date: Tue, 27 Feb 2018 12:49:06 +0200
Subject: [PATCH 2/2 v3] mmc: dw_mmc: Fix the CTO overflow calculation for
 32-bit systems
In-Reply-To: <20180227115243.7ca84b3b@xhacker.debian>
References: <20180226143413.44134-1-Evgeniy.Didin@synopsys.com>
 <20180226143413.44134-3-Evgeniy.Didin@synopsys.com>
 <CAHp75Vct=jMohCFnn3aoZCAw-Q8=8OOF-nPXh9dfwrWHVPXSfA@mail.gmail.com>
 <1519658060.31245.4.camel@synopsys.com>
 <CAHp75VeJhHWhxc4DBiqiu4n6raXbNQ0+W5YX_jthQd2OFF9F=w@mail.gmail.com>
 <1519665265.31245.6.camel@synopsys.com>
 <CAHp75VcABGN+awEUzNiTAc985EM0XVS6eiNLGYYD1_vCrRC00Q@mail.gmail.com>
 <1519676841.2997.7.camel@synopsys.com>
 <20180227115243.7ca84b3b@xhacker.debian>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAHp75Vfb6HQvx531bDi_j1wG=-vae73o+hcOyCGfOeQKEUpYeg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Feb 27, 2018 at 5:52 AM, Jisheng Zhang
<Jisheng.Zhang@synaptics.com> wrote:
> On Mon, 26 Feb 2018 20:27:22 +0000 Alexey Brodkin wrote:
>> On Mon, 2018-02-26@20:30 +0200, Andy Shevchenko wrote:
>> > On Mon, Feb 26, 2018 at 7:14 PM, Evgeniy Didin
>> > <Evgeniy.Didin@synopsys.com> wrote:
>> > > On Mon, 2018-02-26@18:53 +0200, Andy Shevchenko wrote:
>> > > > On Mon, Feb 26, 2018 at 5:14 PM, Evgeniy Didin

>> > > > > > IIRC, someone commented on this or similar, i.e.
>> > > > > > DIV_ROUND_UP_ULL() ?

^^^^^^^^^^^^

>> So maybe we need to add export of __udivdi3() for other arches, what do you think?

> Per my understanding, Linux kernel prefer to make use of do_div or implementations
> in <linux/math64.h> for 64bit divide

To everyone in this thread. See just above. That's solution which will work.
Other than that, drop COMPILE_TEST from the Kconfig and put a comment
that driver will not compile on architectures w/o division library.

-- 
With Best Regards,
Andy Shevchenko
