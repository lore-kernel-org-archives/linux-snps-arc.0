Return-Path: <SRS0=IDKR=KB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A981C433ED
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 May 2021 01:39:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B779C613B4
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 May 2021 01:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B779C613B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rhuwVTAw5qJYv99W5PLwm3sERFi1CqyP3sqUJutpugg=; b=DpPyQ2J1879gKYiKhGTCkEHhI
	Q1lwUHql+Q7A67LDURn2faHziDRKc9xE2RdYXo8TobVz9I/MonBd1sS/avySVD6O6hgkP4cr2xpHl
	xxsYKJQC4ryFUICEB7Tns6ZtYAGgUEjVw7R3isD1F8H8XeqmRNf97D44/wBs5grrw2ScTCcvrwslR
	6ly12//QoLMGt5xhAt65lDqtacqBG4I1kI/RNGsyG6JL+KAEIEGSMJbzCq6E4NGPdEHR7cjcjpuqT
	m7tyn32ySjttWBps8GGn6QBquAgZsVo2Fk1qznbqjN4rfisUUo/W4ZWasY3bEWQujej207YSNWMNT
	fr423WF6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leSyh-002qru-6S; Thu, 06 May 2021 01:38:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leSyf-002qrf-A8
 for linux-snps-arc@desiato.infradead.org; Thu, 06 May 2021 01:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GAyDFaTjHY/6Dn6xaDCeqQ7gvc7tXaoDnzu1sQZc+CQ=; b=JfKa2l9exodKpoa8ztYFDiRUZ/
 V/UVhyoH1v+TJhcCI/F2V+1OXFJ/iBr6nIh7jUYbfDIHxw8TDcU/i8bADuyXMQ7E3O8PnI26uZTUV
 Lv662WI86ekHm+tiZxM2mFoS9eaqtsQ+9bP5FXBtF9FcPv3rGtvRiLll9vyWa8EpKY2TXrwkA4xeq
 FuVkTmkOLksV6Scqw9FyIIAXHIhCFEvOxV6tM8O1logmRHTad8ot0oPfMvL+REmUZCL4OQcHMfAnC
 wKgHp+/b7PJxOF8jdviA1zwuBoeQRBd5sPMqMR0rvIsARes6EO7aBbbBrLq6pr8w+XeN3kLyBN2VE
 LTQ34qfA==;
Received: from vmicros1.altlinux.org ([194.107.17.57])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1leSyb-005Tue-Og
 for linux-snps-arc@lists.infradead.org; Thu, 06 May 2021 01:38:55 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 3FC9772C8B5;
 Thu,  6 May 2021 04:38:47 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 311EC7CC8AF; Thu,  6 May 2021 04:38:47 +0300 (MSK)
Date: Thu, 6 May 2021 04:38:47 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: config-patches@gnu.org, linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH] Recognize arc64
Message-ID: <20210506013846.GD27615@altlinux.org>
References: <20210421195118.158464-1-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421195118.158464-1-vgupta@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_183854_206684_99C56AB8 
X-CRM114-Status: GOOD (  19.71  )
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

On Wed, Apr 21, 2021 at 12:51:18PM -0700, Vineet Gupta wrote:
> This paves way for setting up arc64 software ecosystem.
> 
> $ make check
> cd testsuite && bash config-guess.sh && rm uname
> PASS: config.guess checks (135 tests)
> cd testsuite && bash config-sub.sh
> PASS: config.sub checks (852 tests)
> PASS: config.sub idempotency checks (789 tests)
> PASS: config.sub canonicalise each config.guess testcase (135 tests)
> 
> * config.guess (arc64:Linux:*:*): Recognize.
> * config.sub (arc64): Likewise.
> * doc/config.guess.1: Regenerate.
> * doc/config.sub.1: Likewise.
> * testsuite/config-guess.data: Add test cases for arc64.
> * testsuite/config-sub.data (arc64, arc*-elf): Add test cases.
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  config.guess                | 4 ++--
>  config.sub                  | 4 ++--
>  doc/config.guess.1          | 2 +-
>  doc/config.sub.1            | 2 +-
>  testsuite/config-guess.data | 1 +
>  testsuite/config-sub.data   | 5 +++++
>  6 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/config.guess b/config.guess
> index 1972fda8eb05..a6646ed28258 100755
> --- a/config.guess
> +++ b/config.guess
> @@ -2,7 +2,7 @@
>  # Attempt to guess a canonical system name.
>  #   Copyright 1992-2021 Free Software Foundation, Inc.
>  
> -timestamp='2021-01-25'
> +timestamp='2021-04-21'
>  
>  # This file is free software; you can redistribute it and/or modify it
>  # under the terms of the GNU General Public License as published by
> @@ -949,7 +949,7 @@ EOF
>  	if test "$?" = 0 ; then LIBC=gnulibc1 ; fi
>  	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
>  	exit ;;
> -    arc:Linux:*:* | arceb:Linux:*:*)
> +    arc:Linux:*:* | arceb:Linux:*:* | arc64:Linux:*:*)
>  	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
>  	exit ;;
>      arm*:Linux:*:*)
> diff --git a/config.sub b/config.sub
> index 7f7d0b055ac5..d70247c08d12 100755
> --- a/config.sub
> +++ b/config.sub
> @@ -2,7 +2,7 @@
>  # Configuration validation subroutine script.
>  #   Copyright 1992-2021 Free Software Foundation, Inc.
>  
> -timestamp='2021-03-10'
> +timestamp='2021-04-21'
>  
>  # This file is free software; you can redistribute it and/or modify it
>  # under the terms of the GNU General Public License as published by
> @@ -1165,7 +1165,7 @@ case $cpu-$vendor in
>  			| alphapca5[67] | alpha64pca5[67] \
>  			| am33_2.0 \
>  			| amdgcn \
> -			| arc | arceb \
> +			| arc | arceb | arc64 \
>  			| arm | arm[lb]e | arme[lb] | armv* \
>  			| avr | avr32 \
>  			| asmjs \
> diff --git a/doc/config.guess.1 b/doc/config.guess.1
> index 75fbb236fd68..f79f1c5f10c5 100644
> --- a/doc/config.guess.1
> +++ b/doc/config.guess.1
> @@ -1,5 +1,5 @@
>  .\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.47.16.
> -.TH CONFIG.GUESS "1" "January 2021" "GNU config.guess (2021-01-25)" "User Commands"
> +.TH CONFIG.GUESS "1" "January 2021" "GNU config.guess (2021-04-21)" "User Commands"
>  .SH NAME
>  config.guess \- guess the build system triplet
>  .SH SYNOPSIS
> diff --git a/doc/config.sub.1 b/doc/config.sub.1
> index 317c8c47a180..9d52cebf58d0 100644
> --- a/doc/config.sub.1
> +++ b/doc/config.sub.1
> @@ -1,5 +1,5 @@
>  .\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.47.16.
> -.TH CONFIG.SUB "1" "March 2021" "GNU config.sub (2021-03-10)" "User Commands"
> +.TH CONFIG.SUB "1" "March 2021" "GNU config.sub (2021-04-21)" "User Commands"
>  .SH NAME
>  config.sub \- validate and canonicalize a configuration triplet
>  .SH SYNOPSIS
> diff --git a/testsuite/config-guess.data b/testsuite/config-guess.data
> index f240e9ce61df..73908abb4e06 100644
> --- a/testsuite/config-guess.data
> +++ b/testsuite/config-guess.data
> @@ -35,6 +35,7 @@ amd64 | 7.0_RC1 | NetBSD | ignored | x86_64 | x86_64-unknown-netbsd7.0
>  amd64 | 7.2.1 | Isilon OneFS | ignored | ignored | x86_64-unknown-onefs
>  arc | ignored | Linux | ignored | ignored | arc-unknown-linux-gnu
>  arceb | ignored | Linux | ignored | ignored | arceb-unknown-linux-gnu
> +arc64 | ignored | Linux | ignored | ignored | arc64-unknown-linux-gnu
>  arm | 12.0 | FreeBSD | ignored | armv6 | armv6-unknown-freebsd12.0-gnueabihf
>  arm | 12.0 | FreeBSD | ignored | armv7 | armv7-unknown-freebsd12.0-gnueabihf
>  arm | 12.1 | AROS | ignored | armv7 | arm-unknown-aros
> diff --git a/testsuite/config-sub.data b/testsuite/config-sub.data
> index 101a4c45ec39..0a59eaf1cec7 100644
> --- a/testsuite/config-sub.data
> +++ b/testsuite/config-sub.data
> @@ -59,9 +59,14 @@ amix						m68k-unknown-sysv4
>  apollo68					m68k-apollo-sysv
>  apollo68bsd					m68k-apollo-bsd
>  arc						arc-unknown-none
> +arc-elf						arc-unknown-elf
>  arc-linux					arc-unknown-linux-gnu
>  arceb						arceb-unknown-none
> +arceb-elf					arceb-unknown-elf
>  arceb-linux					arceb-unknown-linux-gnu
> +arc64						arc64-unknown-none
> +arc64-elf					arc64-unknown-elf
> +arc64-linux					arc64-unknown-linux-gnu
>  arm						arm-unknown-none
>  arm-cegcc					arm-unknown-cegcc
>  arm-coff					arm-unknown-coff

Applied, thanks.


-- 
ldv

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
