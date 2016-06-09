From: mpe@ellerman.id.au (Michael Ellerman)
Date: Thu, 09 Jun 2016 21:29:23 +1000
Subject: kisskb: FAILED linux-next/axs103_smp_defconfig/arcv2 Thu Jun
 09, 17:31
In-Reply-To: <1465461796.3203.25.camel@synopsys.com>
References: <20160609073240.1.68347@7e2e7264739d>
 <57592981.2060604@synopsys.com> <1465461796.3203.25.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1465471763.31662.12.camel@ellerman.id.au>
To: linux-snps-arc@lists.infradead.org

On Thu, 2016-06-09@08:44 +0000, Alexey Brodkin wrote:
> Hi Michael,
> 
> On Thu, 2016-06-09@14:02 +0530, Vineet Gupta wrote:
> > Hi Michael,
> > 
> > On Thursday 09 June 2016 01:02 PM, noreply@ellerman.id.au wrote:
> > > 
> > > FAILED linux-next/axs103_smp_defconfig/arcv2 Thu Jun 09, 17:31
> > > 
> > > http://kisskb.ellerman.id.au/kisskb/buildresult/12713783/
> > > 
> > > Commit:   Add linux-next specific files for 20160609
> > >           8f6027f7e808ed7c1fd8c8d37fc7a5076c683c4f
> > > Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4
> > > 
> > > Possible errors
> > > ---------------
> > > 
> > > {standard input}:18606: Error: Instruction with long immediate data in delay slot
> > > make[2]: *** [block/cfq-iosched.o] Error 1
> > > make[1]: *** [block] Error 2
> > > make: *** [sub-make] Error 2
> > This problem has been fixed in tools since - can you switch to a newer toolchain -
> > such as one released last month. @Alexey can you point Michael to right buildroot
> > version ?
> 
> Unfortunately our most recent tools were released a little bit too late to get in
> the most recent Buildroot version and so you'll need to build your toolchain
> from Buildroot's master branch. Basically everything after the following commit will
> should work: https://git.busybox.net/buildroot/commit/?id=caf515e25e699eb306d0b24986734790de80af28

OK thanks.

I'll try and get it build next week. Ping me if I forget.

cheers
