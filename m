Return-Path: <SRS0=QMqO=KM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF6BC433ED
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 17:00:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CDAB61059
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 17:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CDAB61059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iBtOi0d7PHscP3Z2WRbVUHn7y1J6UiOM+g7/Xj2Gfp4=; b=WxxE0KfUvUeiLsCgWdxgOJ5cx
	AigXEslr6jjZzK1zwp+0Y3MGbZypfEBZ+YGCLuwzp9Y3RnTOCt1Z1P2/uMxozuEiCn8mL6yrvQv4S
	dhI1K1lIhCywQwk4UoOxm7frSHsF4N3h4OyiCtOOH9iNnM/YAHM0FV7eswBqZrIL0ZUJeQ3HuXQK4
	P5a85uJ6x99MvMRuau7hog7E6I6atgJaOitaTO2MSs5HGTgU4Q2UYi2jW8pq4lwA+nm2OQYw4/w4C
	9Sk3fF5qtmxZfqqVKYJMSO8KzvDxAINvRMN9BlmhzFQenfGTC6QJ3tE0m1nurFm4eaFE/YTPupCov
	yVVyH430g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ligb0-00Fabr-UL; Mon, 17 May 2021 16:59:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ligaz-00Fabf-Ln
 for linux-snps-arc@desiato.infradead.org; Mon, 17 May 2021 16:59:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3xfahyYW/jnHJwMwazU+pT0VPivGfq13xr8nZvmY63o=; b=4yBOz8DOfhP4ZIY1yMTtPPMZjY
 y8+CKKP2DARIUYrvS+U6Ts4C7wkJSM95DW+D8gVWETbLJWm0piYXlbAxVuSWZ0B3QMB4MebtIrJcS
 ivFk12khUAB7Rm+KVpTo2xUwT4IpUfNXT26SDFNzv9P2n1zZ94pP/meK/an+dLa3DkQ3qMIHOQZ6I
 DGna9iEmGJbvvKA7cz+qwNCyHJ0aPCzkEp2h89/ei1hgqNTfmu6WZl2GHQj2TRvQfWEQ/H6PB2j9j
 HVpfREWWBC2+5xqM1i1huujwNVr4TLRmFQCY5aqm2SzMMPE3iC6LDCNeUAXvGJlFn/+UrO8rIit5C
 jlt+mwMg==;
Received: from smtp2-g21.free.fr ([212.27.42.2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ligaw-00E01p-Ak
 for linux-snps-arc@lists.infradead.org; Mon, 17 May 2021 16:59:56 +0000
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4d1c:7bd4:8778:565f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 755FE2003DD;
 Mon, 17 May 2021 18:59:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1621270758;
 bh=iRSsuTf1C6Fpt/kIWICM4MOM9gfRBGm4EXLKmz8kSSQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gFDjLRWbtP4GzbXEsSAos9eL6cJ+ezsnMKqYJb5CMKK7h0rmzOzS+yUQ+9Le0gAfm
 ASOcySWsasdyN6S8KJ2eClCkQHvlHErASXeO9qwVeXIevGiDo3i94mFySWJ7nxNNbr
 kOijhvrpbwfn5RDdyFN9RrIe1CMqVD7g4OrwFdCxldInywEqMVqnznp0nwjoiNXls3
 rNGUSDCIr+m9XLMTRO/XGpRhQ3NDCqhqYW6tgwrYTWtP+1h3aJHFQ21m2xv6kDR+Tg
 Aj1lWC9iS9Oaj6SO0923STKMMbEPBWC5i2Xe0EJDNdWZiJrLPUe1rXyQVuzDZ/s1Z2
 wp6sSZGegS0+w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 May 2021 18:59:05 +0200
Date: Mon, 17 May 2021 18:59:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vineet Gupta via buildroot <buildroot@busybox.net>,
 Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [Buildroot] [PATCH v3 3/4] lmbench: emulate --prefix to avoid
 scattering binaries all over
Message-ID: <20210517165905.GB2506@scaer>
References: <20210510180049.61421-1-vgupta@synopsys.com>
 <20210510180049.61421-5-vgupta@synopsys.com>
 <20210510220931.1dc78bde@windsurf>
 <e39b28e8-79c9-df44-5113-82af630ebdfb@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e39b28e8-79c9-df44-5113-82af630ebdfb@synopsys.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_095954_703790_BE26CF0A 
X-CRM114-Status: GOOD (  11.84  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Vineet, All,

On 2021-05-10 20:22 +0000, Vineet Gupta via buildroot spake thusly:
> On 5/10/21 1:09 PM, Thomas Petazzoni wrote:
> > On Mon, 10 May 2021 11:00:48 -0700
> > Vineet Gupta via buildroot <buildroot@busybox.net> wrote:
> >
> >>   - moves all lmbench binaries to <target>/lmbench/bin/<ARCH>
> >>   - scripts copied to <target>/lmbench/scripts
> >>   - scripts/os overwritten to setup "OS" as expected by LMBench runtime scripts
> >>
> >> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> > Where are lmbench binaries currently installed? Because /lmbench/ looks
> > really really odd as an installation location.
> 
> They are currently scattered over in /usr/sbin I think.

    $ cat output/cat build/lmbench-3.0-a9/.files-list.txt
    lmbench,./usr/bin/bw_file_rd
    lmbench,./usr/bin/bw_mem
    lmbench,./usr/bin/bw_mmap_rd
    [...]
    lmbench,./usr/bin/stream
    lmbench,./usr/bin/timing_o
    lmbench,./usr/bin/tlb
    lmbench,./usr/lib/libmbench.a

That is, everything is in /usr/bin, except for the static library
(which gets trimmed away during tsarget-finalize anyway) which is in
/usr/lib/.

And apart from the tools and the static library, nothing else is
installed, not even a header, so the the static library is only private
to lmbench anyway.

> Indeed /lmbench is non LSB etc, but it is one stop shop if one wanted to 
> remove everything lmbench specific from target rootfs.
> I guess one could do /usr/sbin/lmbench/{bin,scripts}

But why would you want to enable lmbench, and remove it from target?

So, for me, there is no reason for this patch: lmbench already installs
everything in standard locations, and if one does not want lmbench tools
on the target, just do not enable the lmbench package to begin with.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
