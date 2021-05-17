Return-Path: <SRS0=QMqO=KM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFD3C43460
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 20:09:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 072B46128E
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 20:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 072B46128E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L0kf7Au+hLAwytlrJ5O0L2YBMNmfxqZFDg7lWMNDtGk=; b=mjiu3JnOCL0kZ6VOKdw5eBD6Z
	53OjkxPXhntdKgpydkZJ5nMOcyAM+KBflMJMEF2We9nJgSULopeSVAPDkqJUWX+X1XP+dzRuiWuiR
	57nDQ2ChBf1Wnqp2FqhXIEDTJ2kL8WhKRNqcik001I1W7MT+Ji9Q2l6xpYh4vIDJyo9CmcHSZgc+h
	Y0FlGUu7qRe5OkNUkdUjzxeucTqtdViNw3sI8Tv3xqgXA+lYhIgwHXZAZb9w6/p1LBVgzvNZmJCke
	wzSdDq+hqLyF6pocImsXdtIxgv2xTnpyid4F/TK2sA+tb8hK+wO1aOCVSSV4YTg3pc162y1DBkFuG
	pOyIsUS/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lijYo-00G1sN-6q; Mon, 17 May 2021 20:09:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijYm-00G1rj-26
 for linux-snps-arc@desiato.infradead.org; Mon, 17 May 2021 20:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kc5FyQeDXO/5eAD8UKc+vEmWcQJRjN6p4jsGNsncKrA=; b=jWJ64eIWPJrfVbuMjNigKu9tuF
 Q9fiy5oGrVU9mdxgm0m9ENfHenRx4PkX8BbCVXHsQQLrokiaMjNwRdyg82mhrfhXcDLV9dDRWSex4
 tRcwsf4OMMS41Ym316sVpy55IReZ8L7O3VTbtoRb/RkVwer5EihYGnbJjx6fUQCx35RbM1IksqNB0
 Que0s4ItLp+ZC/H/a+XwmPILVsM/JXCSqyDcbsjJwpacJSXylGrwNBLizz5Q75VJC36JBsswKOb+h
 a/5LuzxpHlnu/45cG9fXaNO2i8HQ3e3PdGmevyiQFhRrGnnC8PU4Tf6e7eGssgGce9wF10mmlnRG+
 +KEknRvA==;
Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijYj-00E7I8-2e
 for linux-snps-arc@lists.infradead.org; Mon, 17 May 2021 20:09:50 +0000
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1caa:dc3:ec0a:c9c0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5EBCF13F879;
 Mon, 17 May 2021 22:09:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1621282157;
 bh=oRpd8TG7s/tXs6lyjxJ8qth2Jb6jBHz9ZKQtECpBUv4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R0S+zS5SkN2QSm+kpe0+idBAwItbBj2w/j2MvOGKDU8wDTh30r1pu0LbSGVyCQSRC
 ffVO8HeCdZrcJ+9m+jNh0qwy7K5tMo7B6/FDUUHiWtEzln/0GqmiJqc3EcgDlvPpxk
 KFxBx+HYbzR9JquNA+wDF7zH8JksVcUDPiXbn57SSzwpJ1lhpeq+Koiyt5zatXM4BN
 4yrFMh+uhUNeC3fzw6r/rJW9HCC8cUMNMp4CbcRm1n8BfBBAVd4cxh1NbDD8yoykEz
 rvJHCHWJaiBTrKe9s+ofG0V9arql/c1COnNQbiadSWrfIQjbff6TCekQfN6ohHqLgl
 N+N6XWC84AhVw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 May 2021 22:09:06 +0200
Date: Mon, 17 May 2021 22:09:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: buildroot@busybox.net, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com
Subject: Re: [Buildroot] [PATCH v3 2/4] lmbench: memsize: increase delay for
 slow FPGAs
Message-ID: <20210517200906.GE2506@scaer>
References: <20210510180049.61421-1-vgupta@synopsys.com>
 <20210510180049.61421-4-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510180049.61421-4-vgupta@synopsys.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_130949_293062_481B8501 
X-CRM114-Status: GOOD (  19.96  )
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

On 2021-05-10 11:00 -0700, Vineet Gupta via buildroot spake thusly:
> otherwise memsize bails out and erroneously reports 1 MB
> 
> NOK
> ----
> | />/lmbench/bin/arc/memsize 16
> |
> | 1
> 
> OK
> ---

This triple-dash line is the usual git marker to end the actual commit
log, so everything below was dropped when applying the patch with git-am.
I've fixed that, and applied to master, thanks.

However, I wonder how relevant lmbench is nowadays. Indeed, there has
been zero activity on lmbench source code since June 2009, almost 12
years ago now...

Regards,
Yann E. MORIN.

> | />/lmbench/bin/arc/memsize 16
> | 2MB OK3MB OK4MB OK5MB OK6MB OK7MB OK8MB OK9MB OK10MB OK11MB OK12MB OK13MB OK14MB OK15MB OK16MB OK
> | 16
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  ...c-to-prevent-memsize-from-timingout-.patch | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch
> 
> diff --git a/package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch b/package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch
> new file mode 100644
> index 000000000000..6c3e7370e11b
> --- /dev/null
> +++ b/package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch
> @@ -0,0 +1,28 @@
> +From d85b61666aa2728f68b69d02bfb162c432df709f Mon Sep 17 00:00:00 2001
> +From: vgupta <vgupta@4eed8e25-bc12-0410-818a-f70ee6866280>
> +Date: Sat, 3 Mar 2012 10:02:24 +0000
> +Subject: [PATCH] TOO_LONG 100 usec to prevent memsize from timingout @80Mhz
> +
> +git-svn-id: http://sjvm-subversion02.internal.synopsys.com/svn/OSS/ARC_Linux/tests/lmbench-3.0-a9@157318 4eed8e25-bc12-0410-818a-f70ee6866280
> +
> +Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> +---
> + src/memsize.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/memsize.c b/src/memsize.c
> +index eb25a0924872..b333cf8cbd32 100644
> +--- a/src/memsize.c
> ++++ b/src/memsize.c
> +@@ -15,7 +15,7 @@ char	*id = "$Id$\n";
> + #define	CHK(x)	if ((x) == -1) { perror("x"); exit(1); }
> + 
> + #ifndef	TOO_LONG
> +-#define	TOO_LONG	10	/* usecs */
> ++#define	TOO_LONG	100	/* usecs */
> + #endif
> + 
> + int	alarm_triggered = 0;
> +-- 
> +2.25.1
> +
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

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
