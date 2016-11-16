From: robh+dt@kernel.org (Rob Herring)
Date: Wed, 16 Nov 2016 12:14:53 -0600
Subject: [PATCH 4/4] Update device tree Synopsys DW DMAC documentation
In-Reply-To: <1479319704.22212.0.camel@linux.intel.com>
References: <1479304615-11360-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1479304615-11360-5-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1479309042.24056.40.camel@linux.intel.com>
 <1479315682.2534.20.camel@synopsys.com>
 <1479319704.22212.0.camel@linux.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAL_JsqKiTVt=9LSdzFg1X66nYf07-HowwRRUDzyMpq=GcQi7kA@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Nov 16, 2016 at 12:08 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, 2016-11-16@17:01 +0000, Eugeniy Paltsev wrote:
>> On Wed, 2016-11-16@17:10 +0200, Andy Shevchenko wrote:
>> > Overall, since we are going to expose some properties to the Device
>> > Tree
>> > I would really think twice about naming. Better if we reuse
>> > something
>> > existing already.
>> >
>> > So, what I can see is
>> >
>> > dmacap,private
>> > dmacap,memcpy
>> >
>> > Here is a selling point as well, i.e. standardization.
>> >
>>
>> As I can see these property name used only in "mv_xor" driver. And
>> they are marked as deprecated.
>> So, I'm not sure if I should used these names.
>
> Oh, good catch! So, then I leave this to DT experienced guys to decide.
> Rob?

Well, maybe they were deprecated for a reason? This all seems like
user configuration to me. So either they don't belong in DT or should
be common if they do.

Rob
