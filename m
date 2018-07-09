From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 9 Jul 2018 07:22:08 +0000
Subject: [RESEND PATCH v2] devres: Really align data field to unsigned
 long long
In-Reply-To: <CAMuHMdVBBu6gho_JVQTiOHxVFHqX2MUxS_c-6-x50OEu4OqpRQ@mail.gmail.com>
References: <20180709044444.6397-1-abrodkin@synopsys.com>
 <20180709054842.GB7618@kroah.com>
 <CAMuHMdVBBu6gho_JVQTiOHxVFHqX2MUxS_c-6-x50OEu4OqpRQ@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <71dfb71de86ebe365897b2069bec0cb40b376928.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Geert,

On Mon, 2018-07-09@09:07 +0200, Geert Uytterhoeven wrote:
> On Mon, Jul 9, 2018@7:49 AM Greg KH <greg@kroah.com> wrote:
> > On Mon, Jul 09, 2018@07:44:44AM +0300, Alexey Brodkin wrote:
> > > Depending on ABI "long long" type of a particular 32-bit CPU
> > > might be aligned by either word (32-bits) or double word (64-bits).
> 
> Or even 16-bit (on e.g. m68k).

Indeed, thanks for the note!
Will add this in my v3.

For ARC I'd like this fix to be back-ported starting
from v4.8 where we added support of "native" atomic64_t, see commit
ce6365270ecd (" ARCv2: Implement atomic64 based on LLOCKD/SCONDD instructions").

What about m68k, do you have any preference of earliest kernel version
where this fix might be useful?

-Alexey
