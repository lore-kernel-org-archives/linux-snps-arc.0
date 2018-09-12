From: linux@roeck-us.net (Guenter Roeck)
Date: Wed, 12 Sep 2018 14:41:04 -0700
Subject: [PATCH] ARCv2: build: use mcpu=hs38 iso generic mcpu=archs
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075012B0949BC@us01wembx1.internal.synopsys.com>
References: <20180912165817.GA5118@roeck-us.net>
 <C2D7FE5348E1B147BCA15975FBA23075012B0949BC@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180912214104.GA28367@roeck-us.net>
To: linux-snps-arc@lists.infradead.org

On Wed, Sep 12, 2018@05:06:25PM +0000, Vineet Gupta wrote:
> >
> > I use a toolchain based on gcc 7.3.0 and binutils 2.30. What version
> > of gcc and binutils do I need for the builds to complete ?
> 
> Hmm I have a prebuilt 2017.03 release of tools (gcc 7.1.1 based) and I don't see
> the issue above when building net/core/dev.o
> I presume your toolchain was built off of upstream gcc sources.
> Can you please post the output of your arc-linux*gcc -v
> 

I decided to build a new toolchain with gcc 8.2.0 and binutils 2.31.1.
Problem solved ... building with this toolchain works.

Guenter
