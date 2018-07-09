From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 9 Jul 2018 10:23:58 +0000
Subject: [RESEND PATCH v2] devres: Really align data field to unsigned
 long long
In-Reply-To: <91c57eeba2134dd99a9f0e11fa883c7c@AcuMS.aculab.com>
References: <20180709044444.6397-1-abrodkin@synopsys.com>
 <f7499a811ba54c00a11f7525ae216213@AcuMS.aculab.com>
 <c95ac7435736d93843c45628ba4d41a4a4988074.camel@synopsys.com>
 <91c57eeba2134dd99a9f0e11fa883c7c@AcuMS.aculab.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <82d2b36fa913bca6d56c7bf32a653324970817b8.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi David,

On Mon, 2018-07-09@10:18 +0000, David Laight wrote:
> From: Alexey Brodkin
> > Sent: 09 July 2018 11:00
> 
> ...
> > That's a good idea indeed but it doesn't solve the problem with
> > struct devres_node. Consider the following snippet:
> > -------------------------------->8-------------------------------
> > 	struct mystruct {
> > 		atomic64_t myvar;
> > 	}
> > 
> > 	struct mystruct *p;
> > 	p = devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
> > -------------------------------->8-------------------------------
> > 
> > Here myvar address will match address of "data" member of struct devres_node.
> > So if "data" is has offset of 12 bytes from the beginning of a page then
> > myvar won't be 64-bit aligned regardless of myvar's attribute, right?
> 
> ...
> > > > -	unsigned long long		data[];	/* guarantee ull alignment */
> 
> Ahh, that line should be:
> 	u8 data[] __aligned(8); /* Guarantee 64bit alignment */

And that pretty much what I suggested in my initial patch :)

For the record x86 has exactly the same atomic64_t as you suggested,
see https://elixir.bootlin.com/linux/latest/source/arch/x86/include/asm/atomic64_32.h#L13:
---------------------->8------------------
typedef struct {
	u64 __aligned(8) counter;
} atomic64_t;
---------------------->8------------------

-Alexey
