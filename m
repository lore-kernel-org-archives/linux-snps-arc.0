From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 9 Jul 2018 09:59:35 +0000
Subject: [RESEND PATCH v2] devres: Really align data field to unsigned
 long long
In-Reply-To: <f7499a811ba54c00a11f7525ae216213@AcuMS.aculab.com>
References: <20180709044444.6397-1-abrodkin@synopsys.com>
 <f7499a811ba54c00a11f7525ae216213@AcuMS.aculab.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c95ac7435736d93843c45628ba4d41a4a4988074.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi David,

On Mon, 2018-07-09@09:16 +0000, David Laight wrote:
> From: Alexey Brodkin
> > Sent: 09 July 2018 05:45
> > Depending on ABI "long long" type of a particular 32-bit CPU
> > might be aligned by either word (32-bits) or double word (64-bits).
> > Make sure "data" is really 64-bit aligned for any 32-bit CPU.
> > 
> > At least for 32-bit ARC cores ABI requires "long long" types
> > to be aligned by normal 32-bit word. This makes "data" field aligned to
> > 12 bytes. Which is still OK as long as we use 32-bit data only.
> > 
> > But once we want to use native atomic64_t type (i.e. when we use special
> > instructions LLOCKD/SCONDD for accessing 64-bit data) we easily hit
> > misaligned access exception.
> 
> Shouldn't there be a typedef for the actual type.
> Perhaps it is even atomic64_t ?
> And have the __aligned(8) applied to that typedef ??

That's a good idea indeed but it doesn't solve the problem with
struct devres_node. Consider the following snippet:
-------------------------------->8-------------------------------
	struct mystruct {
		atomic64_t myvar;
	}

	struct mystruct *p;
	p = devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
-------------------------------->8-------------------------------

Here myvar address will match address of "data" member of struct devres_node.
So if "data" is has offset of 12 bytes from the beginning of a page then
myvar won't be 64-bit aligned regardless of myvar's attribute, right?


> > That's because even on CPUs capable of non-aligned data access LL/SC
> > instructions require strict alignment.
> 
> ...
> > --- a/drivers/base/devres.c
> > +++ b/drivers/base/devres.c
> > @@ -24,8 +24,12 @@ struct devres_node {
> > 
> >  struct devres {
> >  	struct devres_node		node;
> > -	/* -- 3 pointers */
> > -	unsigned long long		data[];	/* guarantee ull alignment */
> > +	/*
> > +	 * Depending on ABI "long long" type of a particular 32-bit CPU
> > +	 * might be aligned by either word (32-bits) or double word (64-bits).
> > +	 * Make sure "data" is really 64-bit aligned for any 32-bit CPU.
> 
> Just:
> 	/* data[] must be 64 bit aligned even on 32 bit architectures
> 	 * because it might be accessed by instructions that require
> 	 * aligned memory arguments.
> 
> > +	 */
> > +	unsigned long long		data[] __aligned(sizeof(unsigned long long));
> 
> One day assuming that 'unsigned long long' is exactly 64 bits will bite.
> This probably ought to be u64 (or similar).

I agree. Initially I wanted to keep as few changes as possible but
IMHO switching to more predictable data type makes sense.

-Alexey
