Return-Path: <SRS0=ZTxI=DH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D272C4727C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 30 Sep 2020 21:56:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 757CD2064E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 30 Sep 2020 21:56:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QBO3sODp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="eFIvk58e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="d5IN2IO8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 757CD2064E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HMACLMbAteZnN3TuOvWStIv69Yg7dbs9ONfHlJMfPGk=; b=QBO3sODpjNDRWRDd4j0b+v1NT
	FPdaAUmAKXX3PBvdmSKJXvyJ4XwhkmU5FuGJLxfWJ/ltRmFAGAgYxehhjFH6M0p4mxIV7VN9Q2sIS
	KOpoFnmcrUq7j6xnh7UIAy2Ofa7425pnlHVz9ZIK+JXXzIKRduM9W37/wsKoULRCjJ6wFUH0I/+3V
	p6QS17ITs3GigOvHVSbpqzAngcFPQ8fGXSQ93W7pHCcK7UJDQZ6zQtmqFZd18MgswCNmfhiYTdsSg
	UgAZHLLJfMbFE92ZDzJohG83aqEUONhh03y4deTGSAjGOPTwRhVfaIWbo7j26RBm8VcKrCzN8ZTiS
	c6260Jk9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNk5m-0003Gr-7B; Wed, 30 Sep 2020 21:56:54 +0000
Received: from pb-smtp2.pobox.com ([64.147.108.71])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNk5j-0003Fx-Pk
 for linux-snps-arc@lists.infradead.org; Wed, 30 Sep 2020 21:56:53 +0000
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 42BFB91B59;
 Wed, 30 Sep 2020 17:56:41 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=VSZgiN1o+vKU/eQlFdTrfLKr/I0=; b=eFIvk5
 8ePwT1w9haxR/IyRkb1adqI8bpDyEpV00dr96OFQLA3Hu4RUjgYvI7+kxFmbFcmD
 fQQJ2xVbbzxa5+Y2FyiIL7oft7/+qu9tfAciQnDmPaCkExVQx0P89K7fl57FyCkb
 0l1U+UQr24cqWd9dctRBRpoQOZPLU/KUF8mFE=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 3AEDF91B58;
 Wed, 30 Sep 2020 17:56:41 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=7vaauE9ifpoFYNF/9szPugZvrKGm5TBGRwL8+6EHmzc=;
 b=d5IN2IO8ndQ2Bo/FnNTrknoWz6N7nyNJlDiqb166A2B1uX8mm5xCLbvUW0BKrGEEVoTTnm4dX8A3PvOLixKNzALj25zzV/dVE1mixBPxTHH8CbK60fhU1WwtfNGrVp1yjodRlQrw9afVPMieBi+LscitC+xqkVXooLFtqXu+Cs8=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id B412C91B57;
 Wed, 30 Sep 2020 17:56:40 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id BD4BE2DA0BCD;
 Wed, 30 Sep 2020 17:56:39 -0400 (EDT)
Date: Wed, 30 Sep 2020 17:56:39 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: {standard input}:1174: Error: inappropriate arguments for opcode
 'mpydu' (fwd)
In-Reply-To: <6cb32de8-3e29-12a8-446e-bad65cc2d228@synopsys.com>
Message-ID: <nycvar.YSQ.7.78.906.2009301752350.1581@knanqh.ubzr>
References: <nycvar.YSQ.7.78.906.2009301714360.1581@knanqh.ubzr>
 <6cb32de8-3e29-12a8-446e-bad65cc2d228@synopsys.com>
MIME-Version: 1.0
X-Pobox-Relay-ID: D22BD098-0367-11EB-AAB2-2F5D23BA3BAF-78420484!pb-smtp2.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_175651_979458_5B2ADFD9 
X-CRM114-Status: GOOD (  27.89  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, 30 Sep 2020, Vineet Gupta wrote:

> Hi Nicolas,
> 
> On 9/30/20 2:23 PM, Nicolas Pitre wrote:
> > Hello,
> >
> > I just realized you might not be aware of the following issue.
> >
> > The kernel kbuild test robot project identified a build failure on ARC 
> > that bisects down to a patch of mine. 
> 
> Your patch to Linux kernel ? Indeed the report we got for build failure didn't
> provide that context and we will appreciate pointers to same just for curiosity.

Here is the original report:

https://www.spinics.net/lists/kernel/msg3596096.html

> > It turns out that my patch is 
> > highlighting a bug in gcc for ARC.
> 
> In any case, we did reach the same conclusion it is indeed an ARC gcc bug (for Big
> endian builds only) and have created a github ticket for our gcc maintainer to
> resolve. Please note that we've not seen it internally as Big Endian is an
> optional configuration option and not in wide spread use for us.
> 
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/300
> 
> 
> And we can also confirm this is seen in gcc 9 and gcc 10 both.
> 
> Thx,
> -Vineet
> 
> >
> > ---------- Forwarded message ----------
> > Date: Mon, 28 Sep 2020 17:43:20 -0400 (EDT)
> > From: Nicolas Pitre <nico@fluxnic.net>
> > To: Rong Chen <rong.a.chen@intel.com>
> > Cc: kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
> >     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, gcc@gcc.gnu.org
> > Message-ID: <nycvar.YSQ.7.78.906.2009281705410.1581@knanqh.ubzr>
> > Subject: Re: {standard input}:1174: Error: inappropriate arguments for opcode
> >     'mpydu'
> >
> > On Sun, 27 Sep 2020, Rong Chen wrote:
> >
> >> Hi Nicolas,
> >>
> >> Thanks for the feedback, the error still remains with gcc 10.2.0:
> > I've created the simplest test case that can be. You won't believe it.
> >
> > Test case:
> >
> > $ cat test.c
> > unsigned int test(unsigned int x, unsigned long long y)
> > {
> > 	y /= 0x20000000;
> > 	if (x > 1)
> > 		y *= x;
> > 	return y;
> > }
> > $ export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/0day/gcc-9.3.0-nolibc/arc-elf/libexec/gcc/arc-elf/9.3.0
> > $ ~/0day/gcc-9.3.0-nolibc/arc-elf/bin/arc-elf-gcc -mcpu=hs38 -mbig-endian -O2 -c test.c
> > /tmp/cc0GAomh.s: Assembler messages:
> > /tmp/cc0GAomh.s:21: Error: inappropriate arguments for opcode 'mpydu'
> >
> > I know nothing about ARC. Please anyone take it over from here.
> >
> >
> > Nicolas
> 
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
