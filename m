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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C7FC43461
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 20:10:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56D9F61002
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 20:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56D9F61002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZjmK2HzwbqOPOyz64CeDBdUBvIpbtRpKJ4ab/lp0zWA=; b=hOMarKE4E37HPIniMhd6drB/t
	Z2rX/+jYnW/UFnIZSLPcDNI50YOVXvG6i+3szg5Dpf5tRFfKbGgH7sW0/r1+iqzaWgag9tqJRUBHi
	sW7cdsr1p8Id5Fcq/+pmi65VQHSHaTvnpqLvzjd7nI3DVhBYBbPicQ/VN0YCdrvBQIyKLEwM320UA
	MH6iFlaF5l8T/WuTOo+L+tNNbEvxHHttViqioynU4n0WB10uDck8Hgo/ZxJMsog9P2Y2e8nno4zyH
	5VAv0MZwJTA56rr5vi5d15jAoGto+idFZZC2y1xd2Z9meJoVjPp0VLlSD6mQR/FsHncLvYpkJzabV
	rqjcE+wkA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lijZf-00G1vi-Qn; Mon, 17 May 2021 20:10:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijZb-00G1vW-Ec
 for linux-snps-arc@desiato.infradead.org; Mon, 17 May 2021 20:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rhy3YgqFkMVgLVPcFj8TeHCVxN5EE8hBfkZQHMNSI48=; b=qiIz934bl/LuNtQj+QOJ0yWVlO
 OTTKUbU/pn0uevUx0CqU+YNtXGSaJzoamN+9j3hgVQ5RHZEngRnOkAXh+BczZEPrB6WnQemSonHZ+
 DGDr+C62pp5MNrlJ51RtM8G3woIJ/cvozYuBjD3EPtuSErsQe4NcQsEPVHieqDBhlVuS0pbLiGy5u
 MKumpd25pjtANomf/fvBxZ7sWSzYcfs6n8iaPrz4IpcJfg+fhrp4+6DAHTEMxG0r2Cv3hzB3WaMnM
 b29NBZYZ8VWUXcX4HdZ2MHTJGmowwnhj2nZj17/SMfufj7qyCwYqX3B91Jt7Zj8TshsGyoqkRewFq
 un8RG1Vg==;
Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijZY-00E7SH-CV
 for linux-snps-arc@lists.infradead.org; Mon, 17 May 2021 20:10:42 +0000
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1caa:dc3:ec0a:c9c0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CDA5313F892;
 Mon, 17 May 2021 22:09:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1621282209;
 bh=VW8uSZXHQosqL1kzpOF2cImdVJPkCSha0eShAMApybA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sMg+SPjmPnG4odDpgtjqfwV47B4lPgvT/0+W5NHxdaC01oVNXk04AgSduz6D7uxmc
 T8rHECRoqEE9OoWRB1WJqEt27I96oYQQcfD3B6BCnm84gXL0/pvaif0bxNeBopdiWu
 Mx5rcl+e3o6WUc0jYQQbfqCJ5XjeQ6GNtUoUz1O9qqqPEDBYcPQ8VV0KAV/TqTCRS5
 xMdudNxtQwuG6quS2aeRmQmlP/1S71bqiD6IH0lIbKEz8CDz6QmZ19WLNn58w/uS8K
 ng/+E+EGXkF6ATGVJcWqnyKLviQ73WcdaKX9ca4RbG2h2RJVPsr+I9KOEEja3vG5EV
 ygayvPhnh/oEQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 May 2021 22:09:58 +0200
Date: Mon, 17 May 2021 22:09:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: buildroot@busybox.net, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com
Subject: Re: [Buildroot] [PATCH v3 4/4] lmbench: lat_rpc: fix stray pointer
Message-ID: <20210517200958.GF2506@scaer>
References: <20210510180049.61421-1-vgupta@synopsys.com>
 <20210510180049.61421-6-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510180049.61421-6-vgupta@synopsys.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_131040_590575_1675A4C1 
X-CRM114-Status: GOOD (  15.37  )
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
> | # ./lat_rpc -S localhost
> | potentially unexpected fatal signal 11.
> | Path: /lmbench/bin/arc64/lat_rpc
> | CPU: 0 PID: 62 Comm: lat_rpc Not tainted 5.6.0-00224-g8e1b159f529e #39
> | Invalid Read @ 0x00000001 by insn @ 0x2011f110
> |   @off 0x6c110 in [/lib/libc-2.32.so]  VMA: 0x200b3000 to 0x201b8000
> | ECR: 0x00050100 EFA: 0x00000001 ERET: 0x2011f110
> | STAT32: 0x80081082 [IE U     ]   BTA: 0x2011b87c
> |  SP: 0x5fffefe8  FP: 0x00000000 BLK: 0x20103242
> | r00: 0x00000001 r01: 0x00000002 r02: 0x00000001
> | r03: 0x20101eb0 r04: 0x00000001 r05: 0x00000001
> | r06: 0x00000000 r07: 0x00000000 r08: 0x00000001
> | r09: 0x2019d8b0 r10: 0x20039fc4 r11: 0x5ffff0f0
> | r12: 0x2019d6d0 r13: 0x2019d748 r14: 0x5ffff588
> | r15: 0x00000000 r16: 0x00000000 r17: 0x5ffff708
> | r18: 0x20039fc0 r19: 0xffffffff r20: 0x201ba010
> | r21: 0x00000000 r22: 0x00000000 r23: 0x20039fc0
> | r24: 0x00000bd0 r25: 0x00000073
> Segmentation fault
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

Applied to master, thanks.

I was going to suggest sending those patches upstream to lmbench,
but.... It's dead, Jim.

Regards,
Yann E. MORIN.

> ---
>  ...bage-pointer-for-lat_rpc-S-localhost.patch | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch
> 
> diff --git a/package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch b/package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch
> new file mode 100644
> index 000000000000..619ec3861463
> --- /dev/null
> +++ b/package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch
> @@ -0,0 +1,25 @@
> +From 3830453a06269912d2772fe8c31bae44f27bb131 Mon Sep 17 00:00:00 2001
> +From: Vineet Gupta <vgupta@synopsys.com>
> +Date: Fri, 8 May 2015 11:35:58 +0530
> +Subject: [PATCH] Fix garbage pointer for lat_rpc -S localhost
> +
> +Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> +---
> + src/lat_rpc.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/lat_rpc.c b/src/lat_rpc.c
> +index 9c021926d761..ff4380ff38f3 100644
> +--- a/src/lat_rpc.c
> ++++ b/src/lat_rpc.c
> +@@ -101,6 +101,7 @@ main(int ac, char **av)
> + 	char	*usage = "-s\n OR [-p <tcp|udp>] [-P parallel] [-W <warmup>] [-N <repetitions>] serverhost\n OR -S serverhost\n";
> + 
> + 	state.msize = 1;
> ++	state.server = NULL;
> + 
> + 	while (( c = getopt(ac, av, "sS:m:p:P:W:N:")) != EOF) {
> + 		switch(c) {
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
