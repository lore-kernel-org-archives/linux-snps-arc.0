From: David.Laight@ACULAB.COM (David Laight)
Date: Mon, 9 Jul 2018 09:54:54 +0000
Subject: [RESEND PATCH v2] devres: Really align data field to unsigned
 long long
In-Reply-To: <CAMuHMdUdTNpt6G1gzdd6tg9cTo4+kOQCP0Ekouhogug_1sJNPg@mail.gmail.com>
References: <20180709044444.6397-1-abrodkin@synopsys.com>
 <f7499a811ba54c00a11f7525ae216213@AcuMS.aculab.com>
 <CAMuHMdUdTNpt6G1gzdd6tg9cTo4+kOQCP0Ekouhogug_1sJNPg@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3e34f94963ff442ca09cef84fdf160fd@AcuMS.aculab.com>
To: linux-snps-arc@lists.infradead.org

From: Geert Uytterhoeven
> Sent: 09 July 2018 10:23
> On Mon, Jul 9, 2018@11:15 AM David Laight <David.Laight@aculab.com> wrote:
> > From: Alexey Brodkin
> > > Sent: 09 July 2018 05:45
> > > Depending on ABI "long long" type of a particular 32-bit CPU
> > > might be aligned by either word (32-bits) or double word (64-bits).
> > > Make sure "data" is really 64-bit aligned for any 32-bit CPU.
> > >
> > > At least for 32-bit ARC cores ABI requires "long long" types
> > > to be aligned by normal 32-bit word. This makes "data" field aligned to
> > > 12 bytes. Which is still OK as long as we use 32-bit data only.
> > >
> > > But once we want to use native atomic64_t type (i.e. when we use special
> > > instructions LLOCKD/SCONDD for accessing 64-bit data) we easily hit
> > > misaligned access exception.
> >
> > Shouldn't there be a typedef for the actual type.
> > Perhaps it is even atomic64_t ?
> > And have the __aligned(8) applied to that typedef ??
> 
> That indeed sounds like the best thing to do, as it will fix this issue in other
> places, too.

Something like:
typedef struct {
	u64 val __aligned(8);
} atomic64_t;

would pick up most errors.
Including all the places that fail to use atomic_read().

	David
