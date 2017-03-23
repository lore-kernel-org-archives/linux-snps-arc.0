From: Anton.Kolesov@synopsys.com (Anton Kolesov)
Date: Thu, 23 Mar 2017 16:33:12 +0000
Subject: ARC patch suggestion
In-Reply-To: <fa1c8dfb-629b-f2df-c2cc-421369d08868@synopsys.com>
References: <20170323030239.GF20886@waldemar-brodkorb.de>
 <fa1c8dfb-629b-f2df-c2cc-421369d08868@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B13586E6AD4@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

> 
> +CC ARC gnu folks, Anton who maintains an internal build system
> 
> 
> On 03/22/2017 08:02 PM, Waldemar Brodkorb wrote:
> > Hi,
> >
> > I want to success following change:
> >
> > From cde74b83f9b204bf56f304224654e4993dc56efc Mon Sep 17 00:00:00
> 2001
> > From: Waldemar Brodkorb <wbx at openadk.org>
> > Date: Tue, 21 Mar 2017 20:04:21 +0100
> > Subject: [PATCH 2/2] ARC: remove special CFLAGS/LDFLAGS handling
> >
> > Either toolchain defaults or buildsystems should provide the
> > architecture specific CFLAGS and LDFLAGS.
> 
> Seems a decent cleanup to me !
> 
> Acked-by: Vineet Gupta <vgupta at synopsys.com>
> 
> @Anton, @Claudiu, @Cupertino any thoughts : for / against
> 

AK: No issue by me, but I haven't tried to build test this.

Anton
