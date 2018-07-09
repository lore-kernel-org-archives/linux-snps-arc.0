From: David.Laight@ACULAB.COM (David Laight)
Date: Mon, 9 Jul 2018 10:18:36 +0000
Subject: [RESEND PATCH v2] devres: Really align data field to unsigned
 long long
In-Reply-To: <c95ac7435736d93843c45628ba4d41a4a4988074.camel@synopsys.com>
References: <20180709044444.6397-1-abrodkin@synopsys.com>
 <f7499a811ba54c00a11f7525ae216213@AcuMS.aculab.com>
 <c95ac7435736d93843c45628ba4d41a4a4988074.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <91c57eeba2134dd99a9f0e11fa883c7c@AcuMS.aculab.com>
To: linux-snps-arc@lists.infradead.org

From: Alexey Brodkin
> Sent: 09 July 2018 11:00
...
> That's a good idea indeed but it doesn't solve the problem with
> struct devres_node. Consider the following snippet:
> -------------------------------->8-------------------------------
> 	struct mystruct {
> 		atomic64_t myvar;
> 	}
> 
> 	struct mystruct *p;
> 	p = devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
> -------------------------------->8-------------------------------
> 
> Here myvar address will match address of "data" member of struct devres_node.
> So if "data" is has offset of 12 bytes from the beginning of a page then
> myvar won't be 64-bit aligned regardless of myvar's attribute, right?
...
> > > -	unsigned long long		data[];	/* guarantee ull alignment */

Ahh, that line should be:
	u8 data[] __aligned(8); /* Guarantee 64bit alignment */

	David
