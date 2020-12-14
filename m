Return-Path: <SRS0=O7sC=FS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DB0C4361B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Dec 2020 12:00:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73AB323A7C
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Dec 2020 12:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73AB323A7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=evupexWnA5vSzVkwDwGn0hlkQghrvjB8TGNorMkxLYA=; b=p/ZZ03Sig7FyX1DjGl6RD0QEn
	71UYWL/qElV58SxppURvtW1jYbxpRYj62Q6WhzCCehdbN52ibqYMVJgLAx50Uit8U6v9hbn3oDmsm
	P659e0ZfoNlSdoV6RTiEqJNXvtWiKe3Y/DU/vsAzWVYdYC7hX1xReEginIRV6AYn5llOAfbJDY0cq
	Q9olPWFUiLgxgJbqtesrnJN6MUJUTn0ExwRWo3+VwCELnMm7bc+c9mEBxT3HcdG6JFwFKgTYC5M1y
	YNsxnHZ3Hg+4LRf57jm+DuAeahOvaaQzwENfS/FGa8vTFc1fhqU8+tUWqjRBfodFUfWOaL+PY9/TD
	hjV6PD3Fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1komX6-000520-91; Mon, 14 Dec 2020 12:00:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1komX4-00051r-LU
 for linux-snps-arc@merlin.infradead.org; Mon, 14 Dec 2020 12:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=jogJNp6/vs/Jwg0VbE4vOOi59LAUthw2Cix/ceCvqng=; b=md2xfZ/4xhuEfVItVcE30e21s4
 QZRoxWnRmtSgrV+khB9STNRKWjNMmlUP3/X+EBCfXSqg1KaI/BAButfPCdYmJYSzjn3WL5SZzlTfi
 JNdfSYR++39emX1e2kDytxLNSc04ajNZIZHAe6Itsn/R6L3Qul+go2ESMICRpf2Iles6Ube6qsMpt
 VXuiF8c70WYIFITxjxr93Syk0McqUuAxgE7eoz4+zJvKlXM7LJPTIlS6UgCiQW3kK87QDg3Xei0Nf
 t/KkoaL1MhoqnVts8DHaARbLFHtFDv6mfV73jUnGP/YIOZVdLKdei5D+BwTHoXh6K2Ck8sPlHPOd4
 6JqWHmZQ==;
Received: from mout.gmx.net ([212.227.17.22])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1komWz-00065M-NQ
 for linux-snps-arc@lists.infradead.org; Mon, 14 Dec 2020 12:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1607947211;
 bh=vFZUH/A+dSelnEOTvUqfH9AhcXXAFjJO23KGSKyMe0Q=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=YiDa7wFRF63KKOsCZwZiKyBJTRtc3llrtwurcc+0BoyoCDG2BilH/Xm3ZpRu0gptZ
 ntqXelvMXjGFFcePa5pzSWfgn5oWoQy1YO4iIEkHVip933J5LZN8kAvnvab84kIfMy
 WCgSgdJzdApjdmC4l2QG5wMTGzFtdCARto74nXHA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.51] ([62.143.246.89]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPokN-1kRrvE1Yv5-00MrnI; Mon, 14
 Dec 2020 13:00:11 +0100
Subject: Re: [PATCH v5] cacheflush.2: Document __builtin___clear_cache() as a
 more portable alternative
To: Alejandro Colomar <alx.manpages@gmail.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>, Dave Martin <Dave.Martin@arm.com>,
 linux-man@vger.kernel.org
References: <e2424619-2a5a-a44a-2dc0-a16310725250@gmail.com>
 <20201214114306.10784-1-alx.manpages@gmail.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <00c985bb-e363-76ab-3ae8-40f4dfc07d88@gmx.de>
Date: Mon, 14 Dec 2020 13:00:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201214114306.10784-1-alx.manpages@gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:Capo1mKwHx7ISVqgaMVd34VhbCirWAIluLaE2hsUSG/6+gFqGMa
 jDxrchLCTKNXHQYuf7j6HDTCQK/4oUBsJmafO7nRVKpNInYBmzoV1GQISskMWWZNQepT/mb
 pMRma9uLp/K6c2nGYrGjJd3NRtExPQ2xQ7fVT9HKoek6Jf690rQMNKq5CXZbH1aGc+f8THU
 Dok3+PDHXhzOd3qBj6hng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UehdsZnDCLM=:mw2JRYwiXvWEiZr1qkwNun
 a/FXaSwscuUM2Qd+ZSd0U00ioCXtmBUZZhQSL2cMOtYSb6IdfJkx/ouBwCFsf/p/9gpiNdpZ1
 hemLTb4M4QzZl6/Fo5RQcWNNfvrtIYnXdMeYhdsgBcl6J6HQBTMlsUWWIeNEtNK4eN7vicPt2
 p9D73hT+Ijc6FrohOM6yv0aJjr138xVHx6MfROW3xS74p68denQ+L67BDrO0tunv2u0yOpnZF
 jP1P+ix987G/WdqKWw9V4HKFszpy03iluizH+ApGGwBV9BNCVTD0zlYvjb8MIDQXef5V+bxAF
 y6hRkOFREK4gx6zpdGXN5jP5LuEXLJ2ZkkUtPvLV+IQLlOIuRBd1A7EDJghEU36I63eaPfIjA
 oap9q+vJDYGamg6NPlWBigNqaWWQlSH90zo7PzU1LEPUWxTv/J/ULV2t+OREZt3LX+pXChFCw
 W6CDWotqn8NAjJ/14nNAIuff7tlwGlRLJZpj4Kz6/UZ6sE2BjAKCF5nELeELb1EZZaQNU29yu
 PKZlo5Gz1xiL0tkrhYgnXgc5Opx7yZg8Zqgh0WFQuZRT7nsC97IGQhTC/pW+SheDQrFkhUMx1
 1XqfeZrpzyW1SW59lqW6d9PpFHacFCUIGSI9cv9jjCfBGvsWfVOukA3CoDlbsYworbhrSG0lC
 3a+upN04dn8A1kBImhfgeDj23r5KpGBjL9AhyvfUX100eXz7Zh7AGM9UWYiwNDXjaRUD4XKmJ
 OiH7+MRNSmtYnSOaSlIcILI4FzUMDxO28rWe675Mm6c+06LuMrsIqPOJv9LZaiLtd7VBicJkm
 70D3GHApaxccIBvofRkzN8q3/cCWq3VH/BLcXBwE3UvWFVByTMvkLeFhGyrR+LiuRlR3hgOKQ
 DR7cBQIHqsNmBkFt+/xw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_120045_918326_A1ED856B 
X-CRM114-Status: GOOD (  15.45  )
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vincent Chen <deanbo422@gmail.com>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, gcc-patches@gcc.gnu.org,
 linux-snps-arc@lists.infradead.org, cfe-users@lists.llvm.org,
 cfe-dev@lists.llvm.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 12/14/20 12:43 PM, Alejandro Colomar wrote:
> Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>

Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

> ---
>   man2/cacheflush.2 | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>
> diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
> index aba625721..7a2eed506 100644
> --- a/man2/cacheflush.2
> +++ b/man2/cacheflush.2
> @@ -86,6 +86,30 @@ On Linux, this call first appeared on the MIPS architecture,
>   but nowadays, Linux provides a
>   .BR cacheflush ()
>   system call on some other architectures, but with different arguments.
> +.SH NOTES
> +Unless you need the finer grained control that this system call provides,
> +you probably want to use the GCC built-in function
> +.BR __builtin___clear_cache (),
> +which provides a portable interface
> +across platforms supported by GCC and compatible compilers:
> +.PP
> +.in +4n
> +.EX
> +.BI "void __builtin___clear_cache(void *" begin ", void *" end );
> +.EE
> +.in
> +.PP
> +On platforms that don't require instruction cache flushes,
> +.BR __builtin___clear_cache ()
> +has no effect.
> +.PP
> +.IR Note :
> +Until GCC 9.1.0,
> +the prototype for this built-in function used
> +.I char *
> +instead of
> +.I void *
> +for the parameters.
>   .SH BUGS
>   Linux kernels older than version 2.6.11 ignore the
>   .I addr
>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
